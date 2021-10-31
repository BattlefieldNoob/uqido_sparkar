import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:uqido_sparkar/db/models/cookie_response.dart';
import 'package:uqido_sparkar/db/models/public_keys_response.dart';
import 'package:uqido_sparkar/model/sparkar_network_data.dart';

import 'models/netlify_response.dart';

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
  Future<NetlifyResponse<SparkARNetworkData>> getUsersAndEffectWithCookie(@Query("cookie") String cookie);

  @GET("/facebook_public_keys")
  //Future<dynamic> getPublicKeys();
  Future<NetlifyResponse<PublicKeysResponse>> getPublicKeys();
}
