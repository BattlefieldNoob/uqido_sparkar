// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??=
        'https://sparkar-data-extractor.netlify.app/.netlify/functions/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NetlifyResponse<CookieResponse>> getCookiesWithEncryptedLoginData(
    encpass,
    lsd,
    email,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'encpass': encpass,
      r'lsd': lsd,
      r'email': email,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetlifyResponse<CookieResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/facebook_get_cookie',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetlifyResponse<CookieResponse>.fromJson(
      _result.data!,
      (json) => CookieResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<NetlifyResponse<List<Owner>>> getUsersAndEffectWithCookie(
      cookie) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'cookie': cookie};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetlifyResponse<List<Owner>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/facebook_get_users_and_effects',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetlifyResponse<List<Owner>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<Owner>((i) => Owner.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<NetlifyResponse<PublicKeysResponse>> getPublicKeys() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetlifyResponse<PublicKeysResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/facebook_public_keys',
              queryParameters: queryParameters,
              data: _data,
            )
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
