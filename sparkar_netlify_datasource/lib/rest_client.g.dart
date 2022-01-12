// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://sparkar-data-extractor.netlify.app/.netlify/functions/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NetlifyResponse<CookieResponse>> getCookiesWithEncryptedLoginData(
      encpass, lsd, email) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'encpass': encpass,
      r'lsd': lsd,
      r'email': email
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetlifyResponse<CookieResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/facebook_get_cookie',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetlifyResponse<CookieResponse>.fromJson(
      _result.data!,
      (json) => CookieResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<NetlifyResponse<SparkARNetworkData>> getUsersAndEffectWithCookie(
      cookie) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'cookie': cookie};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetlifyResponse<SparkARNetworkData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/facebook_get_users_and_effects',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetlifyResponse<SparkARNetworkData>.fromJson(
      _result.data!,
      (json) => SparkARNetworkData.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<NetlifyResponse<UsersEffectsCookies>> getUsersAndEffectWithCookieV2(
      cookie) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'cookie': cookie};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetlifyResponse<UsersEffectsCookies>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/facebook_get_users_and_effects/v2',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetlifyResponse<UsersEffectsCookies>.fromJson(
      _result.data!,
      (json) => UsersEffectsCookies.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<NetlifyResponse<PublicKeysResponse>> getPublicKeys() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetlifyResponse<PublicKeysResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/facebook_public_keys',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetlifyResponse<PublicKeysResponse>.fromJson(
      _result.data!,
      (json) => PublicKeysResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
