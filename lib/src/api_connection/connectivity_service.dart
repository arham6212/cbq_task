import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../provider/error/error_provider.dart';
import 'custom_exception.dart';

final httpServiceProvider = Provider<HttpService>((ref) {
  String baseUrl = 'https://jsonplaceholder.typicode.com/';

  return HttpService(baseUrl, ref.watch(errorProvider));
});

class HttpService {
  final String _baseUrl;
  final ErrorNotifier _errorNotifier;

  HttpService(this._baseUrl, this._errorNotifier);

  Future<dynamic> get(String path) async {
    var responseJson;

    try {
      final response = await http.get(Uri.parse(_baseUrl + path));
      responseJson = _response(response);
    } on Exception catch (e) {
      _errorNotifier.setError(e.toString());
      throw CustomException(e.toString());
    }
    return responseJson;
  }

  Future<dynamic> post(String path, dynamic data) async {
    http.Response responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + path),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      responseJson = _response(response);
    } on Exception catch (e) {
      _errorNotifier.setError(e.toString());
      throw CustomException(e.toString());
    }
    return responseJson;
  }

  Future<dynamic> put(String path, dynamic data) async {
    http.Response responseJson;

    try {
      final response = await http.put(Uri.parse(_baseUrl + path),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      responseJson = _response(response);
    } on Exception catch (e) {
      _errorNotifier.setError(e.toString());
      throw CustomException(e.toString());
    }
    return responseJson;
  }

  Future<dynamic> delete(String path) async {
    http.Response responseJson;

    try {
      final response = await http.delete(Uri.parse(_baseUrl + path));
      responseJson = _response(response);
    } on Exception catch (e) {
      _errorNotifier.setError(e.toString());
      throw CustomException(e.toString());
    }
    return responseJson;
  }

  _response(var response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        _errorNotifier.setError(response.body.toString());
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        _errorNotifier.setError(response.body.toString());
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        _errorNotifier.setError(
            'Error occurred while communicating with server : ${response.statusCode}');
        throw FetchDataException(
            'Error occurred while communicating with server : ${response.statusCode}');
    }
  }
}
