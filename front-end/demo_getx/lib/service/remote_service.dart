import 'package:demo_getx/constant/const.dart';
import 'package:http/http.dart' as http;

const API_TIMEOUT = Duration(seconds: 30);

class RemoteService {
  final _httpClient = http.Client();

  Future<http.Response> get(String api, [Map<String, String> params]) async {
    final _uri = Uri.http(Constants.API_AUTHORITY, '/apis/cinema/' + api, fieldsToMap(params));

    print('Params::: ${fieldsToMap(params)}');
    print('ApiUri:::' + _uri.toString());
    final response = await _httpClient
        .get(_uri)
        .timeout(API_TIMEOUT, onTimeout: () => throw APIException('TIMEOUT', _uri));

    print('statusCode: ${response?.statusCode}\nbody: ${response?.body}');
    return response;
  }

  Future<http.Response> post(String api, [Map<String, String> body]) async {
    final _uri = Uri.http(Constants.API_AUTHORITY, '/apis/cinema/' + api);

    print('Body::: ${fieldsToMap(body)}');
    print('ApiUri:::' + _uri.toString());
    final response = await _httpClient
        .post(_uri, body: fieldsToMap(body))
        .timeout(API_TIMEOUT, onTimeout: () => throw APIException('TIMEOUT', _uri));

    print('statusCode: ${response?.statusCode}\nbody: ${response?.body}');
    return response;
  }

  Future<http.Response> put(String api, [Map<String, String> body]) async {
    final _uri = Uri.http(Constants.API_AUTHORITY, '/apis/cinema/' + api);

    print('Body::: ${fieldsToMap(body)}');
    print('ApiUri:::' + _uri.toString());
    final response = await _httpClient
        .put(_uri, body: fieldsToMap(body))
        .timeout(API_TIMEOUT, onTimeout: () => throw APIException('TIMEOUT', _uri));

    print('statusCode: ${response?.statusCode}\nbody: ${response?.body}');
    return response;
  }

  void close() => _httpClient?.close();
}

class APIException implements Exception {
  final String message;
  final Uri uri;

  const APIException(this.message, this.uri);

  String toString() => 'APIException: $message $uri';
}

Map<String, String> fieldsToMap(Map value) {
  if (value == null) return null;
  var params = Map<String, String>();
  for (String key in value.keys) {
    if (!(value[key] == null || value[key] == 'null')) params[key] = value[key];
  }
  return params;
}