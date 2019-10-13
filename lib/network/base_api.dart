import 'dart:io';

import 'package:http/http.dart' as http;

class BaseRestAPI {
  final String dns = "https://jsonplaceholder.typicode.com";

  Future<http.Response> getRequest({
    Map<String, dynamic> headers,
    String resourcePath,
    String id = '',
  }) async {
    String fullUrl = dns + resourcePath + id;

    try {
      final response = await http.get(fullUrl);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response;
      } else {
        return http.Response(
            {"errorCode": "Unknown", "body": response.body}.toString(), 404);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<http.Response> postRequest(
      {Map<String, dynamic> dataObject,
      Map<String, dynamic> headers,
      String resourcePath}) async {
    String fullUrl = dns + resourcePath;
    try {
      var client = http.Client();
      final response = await client.post(fullUrl, body: dataObject.toString());

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response;
      } else {
        return http.Response(
            {"errorCode": "Unknown", "body": response.statusCode}.toString(),
            404);
      }
    } catch (e) {
      print(e);
      return http.Response(
          {"errorCode": "Unknown", "body": e.toString()}.toString(), 404);
    }
  }

  Future<http.Response> updateRequest(
    String resourceUrl, {
    Map<String, dynamic> headers,
  }) async {
    String fullUrl = dns + resourceUrl;

    try {
      final response = await http.put(fullUrl, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        return http.Response(
            {"errorCode": "Unknown", "body": response.body}.toString(), 404);
      }
    } catch (e) {
      throw HttpException(e);
    }
  }

  Future<http.Response> deleteRequest(
    String resourceUrl, {
    Map<String, dynamic> headers,
  }) async {
    String fullUrl = dns + resourceUrl;

    try {
      final response = await http.delete(fullUrl, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        return http.Response(
            {"errorCode": "Unknown", "body": response.body}.toString(), 404);
      }
    } catch (e) {
      throw HttpException(e);
    }
  }
}
