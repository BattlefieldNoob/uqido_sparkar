import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:sparkar_data_model/sparkar_network_data.dart';
import 'package:sparkar_netlify_datasource/models/users_effects_cookies.dart';

import 'models/cookie_response.dart';
import 'models/netlify_response.dart';
import 'models/public_keys_response.dart';


part 'rest_client.g.dart';

@RestApi(
    baseUrl: 'https://sparkar-data-extractor.netlify.app/.netlify/functions/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/facebook_get_cookie")
  Future<NetlifyResponse<CookieResponse>> getCookiesWithEncryptedLoginData(
      @Query("encpass") String encpass,
      @Query("lsd") String lsd,
      @Query("email") String email);

  @GET("/facebook_get_users_and_effects")
  Future<NetlifyResponse<SparkARNetworkData>> getUsersAndEffectWithCookie(
      @Query("cookie") String cookie);

  @GET("/facebook_get_users_and_effects/v2")
  Future<NetlifyResponse<UsersEffectsCookies>> getUsersAndEffectWithCookieV2(
      @Query("cookie") String cookie);

  @GET("/facebook_public_keys")
  Future<NetlifyResponse<PublicKeysResponse>> getPublicKeys();
}
