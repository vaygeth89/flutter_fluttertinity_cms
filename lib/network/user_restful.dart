import 'dart:convert';

import 'package:fluttertinity/model/user.dart';
import 'package:fluttertinity/network/base_api.dart';
import 'package:http/http.dart' as http;

class UserRestWebservice extends BaseRestAPI {
  final String resourcePath = "/users";
  final String childUrl = '/';

  UserRestWebservice();

  Future<List<User>> getUsers({int userId}) async {
    http.Response response;
    userId == null
        ? response = await this.getRequest(resourcePath: resourcePath)
        : response =
            await this.getRequest(resourcePath: resourcePath, id: childUrl);
    try {
      Iterable list = json.decode(response.body);
      List<User> users = list.map((item) => User.fromJson(item)).toList();
      return users;
    } catch (e) {
      throw e;
    }
  }

  Future<int> deleteUsers({List<User> users}) async {
    if (users.length <= 0)
      return -1; // -1 means no records are affected and possible invalid request from client end
    try {
      int deletedRecord = 0;
      users.forEach((user) async {
        http.Response response = await this
            .deleteRequest(resourcePath + childUrl + user.id.toString());

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 201) deletedRecord++;
      });
      return deletedRecord;
    } catch (e) {
      throw e;
    }
  }

  Future<int> updateUser(User user) async {
    if (user.id != null || user.id == 0) {
      http.Response response = await this
          .updateRequest(resourcePath + childUrl + user.id.toString());
      Iterable list = json.decode(response.body);
      return list.length;
    }
    return 0;
  }

  Future<int> createUser(User user) async {
    http.Response response;
    try {
      response = await this.postRequest(
          dataObject: user.toJson(), resourcePath: resourcePath + childUrl);
      var value = json.decode(response.body);
      return value["id"] as int;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
