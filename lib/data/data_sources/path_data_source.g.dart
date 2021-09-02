// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PathDataSource implements PathDataSource {
  _PathDataSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.edway.org/supervisor';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<EdwayPath>> fetchAllPaths([offset = 0, limit = 50]) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'offset': offset,
      r'limit': limit
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<EdwayPath>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/paths',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => EdwayPath.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<void> addPath(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/api/paths/add',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
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
