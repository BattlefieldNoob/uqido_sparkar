import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;
import 'package:uqido_sparkar/db/abstract_db.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/utils/facebook_password_encrypt_util.dart';

class SparkARDB with DBCache implements AbstractDB {
  static final SparkARDB _instance = SparkARDB._internal();

  static final Dio dio = Dio();
  static final CookieJar cookieJar = CookieJar();

  SparkARDB._internal() {
    dio.interceptors.add(CookieManager(cookieJar));
  }

  factory SparkARDB.getInstance() {
    return _instance;
  }

  @override
  Future<List<SparkARUser>?> getAllUsers(
      {String? email, EncryptedLoginData? loginData}) async {
    if (email != null && loginData != null) {
      //i must delete login data from cache
      cache.destroy('spark-ar-user-cookie');
      cache.destroy('spark-ar-users-netlify');
    }
    //get actual facebook public keys from netlify function

    try {
      var tokenCookie = (await checkCache<Map<String, dynamic>>(
              'spark-ar-user-cookie', () async {
        if (loginData == null) return [];
        final encpass = loginData.encpass;
        final lsd = loginData.lsd;
        //print(encpasss);
        var cookies = await dio.get(
            'https://sparkar-token-crawler.netlify.app/.netlify/functions/facebook_get_cookie',
            queryParameters: {'encpass': encpass, 'lsd': lsd, 'email': email});

        //print(tokenCookiee);
        return [cookies.data as Map<String, dynamic>];
      }, customCacheDuration: Duration(days: 3)))
          .first;

      try {
        var data = await checkCache<Map<String, dynamic>>(
            'spark-ar-users-netlify', () async {
          if (kIsWeb) {
            return await getUsersAndEffectsByNetlify(tokenCookie['cookie']);
          } else {
            return await getUsersAndEffectsByRequest(
                tokenCookie['cookie'], tokenCookie['token']);
          }
        });

        //print(data);

        return List.unmodifiable(data.map((e) => SparkARUser.fromJson(e)));
      } catch (e) {
        rethrow;
        //return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getUsersAndEffectsByNetlify(
      String cookie) async {
    //print("getUsersAndEffects");
    //print(cookieAndToken);
    var url =
        'https://sparkar-token-crawler.netlify.app/.netlify/functions/facebook_get_users_and_effects';
    final response = await dio.get(url, queryParameters: {'cookie': cookie});

    //print("Print data");
    //print(response.data);
    //final data = jsonDecode(response.data) as List<dynamic>;
    final data = response.data['data'] as List<dynamic>;
    //final cookie = response.data['cookie'] as List<dynamic>;
    //print(data);
    var list = data.map((e) => e as Map<String, dynamic>).toList();
    //print(list);
    return list;
  }

  Future<List<Map<String, dynamic>>> getUsersAndEffectsByRequest(
      String cookie, String token) async {
    print("getUsersAndEffectsByRequest");
    final headers = {
      //'headers': {
      //'cookie': '',
      'authority': ' www.facebook.com',
      'accept': ' */*',
      'accept-language': ' en-US,en;q=0.9,it;q=0.8',
      'content-type': 'application/x-www-form-urlencoded',
      // 'cookie': cookies,
      'origin': ' https://www.facebook.com',
      'referer': ' https://www.facebook.com/sparkarhub/effects/',
      'sec-fetch-dest': ' empty',
      'sec-fetch-mode': ' cors',
      'sec-fetch-site': ' same-origin',
      'user-agent':
          ' Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36'
      // }
    };
    var body = {'doc_id': '', 'variables': '{}', 'fb_dtsg': '', '__a': 1};
    body['doc_id'] = '2737348616365573';
    body['variables'] = '{}';
    body['fb_dtsg'] = token;

    final baseCookies =
        "spin=r.1003566664_b.trunk_t.1617572245_s.1_v.2_; wd=629x947;datr=ATBqYAPPqxHp61lxJHX3QhBF;";

    final cookies = baseCookies + cookie;

    headers['cookie'] = cookies;
    const url = 'https://www.facebook.com/api/graphql/';

    final effectQuery =
        await Dio().post(url, data: body, options: Options(headers: headers));

    print(effectQuery);

    print(effectQuery.data.runtimeType);

    var parsed = jsonDecode(effectQuery.data);

    var owners = parsed['data']['ar_hub_effects_query']['ar_hub_settings']
        ['owners'] as List<Map<String, dynamic>>;
    var users = owners.map((item) {
      return SparkARUser(item['owner']['id'], item['owner']['name'],
          item['owner']['profile_picture']['uri'], []);
    }).toList();

    final usersAndEffects = await getEffectsForUsers(users, cookie, token);

    return usersAndEffects.map((e) => e.toJson()).toList();
  }

  Future<List<SparkARUser>> getEffectsForUsers(
      List<SparkARUser> usersList, cookie, token) async {
    const usersAndEffects = <SparkARUser>[];
    final headers = {
      //'headers': {
      //'cookie': '',
      'authority': ' www.facebook.com',
      'accept': ' */*',
      'accept-language': ' en-US,en;q=0.9,it;q=0.8',
      'content-type': 'application/x-www-form-urlencoded',
      // 'cookie': cookies,
      'origin': ' https://www.facebook.com',
      'referer': ' https://www.facebook.com/sparkarhub/effects/',
      'sec-fetch-dest': ' empty',
      'sec-fetch-mode': ' cors',
      'sec-fetch-site': ' same-origin',
      'user-agent':
          ' Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36'
      // }
    };
    var body = {'doc_id': '', 'variables': '{}', 'fb_dtsg': '', '__a': 1};
    body['doc_id'] = '3625110550842914';
    body['variables'] = '{}';
    body['fb_dtsg'] = token;

    final baseCookies =
        "spin=r.1003566664_b.trunk_t.1617572245_s.1_v.2_; wd=629x947;datr=ATBqYAPPqxHp61lxJHX3QhBF;";

    final cookies = baseCookies + cookie;

    headers['cookie'] = cookies;

    const url = 'https://www.facebook.com/api/graphql/';

    for (final user in usersList) {
      final variables =
          '{"selectedOwnerID":"${user.id}","filters":{"effect_name_contains_ci":"","visibility_statuses":[],"review_statuses":[],"surfaces":[],"exclude_surfaces":["AR_ADS"]},"orderby":["LAST_MODIFIED_TIME_DESC"]}';
      body['variables'] = variables;
      final effectQuery =
          await Dio().post(url, data: body, options: Options(headers: headers));

      var parsed = jsonDecode(effectQuery.data);
      print(parsed);
      final edges =
          parsed['owner']['effects']['edges'] as List<Map<String, dynamic>>;

      final effectsForUser = edges.map((effect) {
        final studioEffect = effect['node']['ar_studio_effect'];
        var isDeprecated = false;
        if (studioEffect['submission_status'] != 'NOT_REVIEWED' &&
            studioEffect['submission_status'] != 'NOT_APPROVED') {
          isDeprecated =
              studioEffect['latest_active_arexport_file']['is_deprecated'];
        }
        return SparkAREffect(
          effect['node']['id'],
          studioEffect['name'],
          studioEffect['submission_status'],
          studioEffect['visibility_status'],
          isDeprecated,
          studioEffect['test_link'],
          studioEffect['share_link'],
          studioEffect['thumbnail_uri'],
        );
      }).toList();
      if (effectsForUser.length != 0) {
        user.effects.addAll(effectsForUser);
        usersAndEffects.add(user);
      }
    }
    return usersAndEffects;
  }
}
