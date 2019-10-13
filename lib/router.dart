import 'package:flutter/material.dart';
import 'package:fluttertinity/widget/edit_user_page.dart';
import 'package:fluttertinity/widget/home_page.dart';
import 'package:fluttertinity/widget/users_page.dart';

class RouterManager {
  static const String homePageRoute = '/';
  static const String usersPageRoute = '/user';
  static const String editUserPageRoute = '/edit';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        {
          return MaterialPageRoute(builder: (_) => UsersPage());
        }
      case usersPageRoute:
        {
          return MaterialPageRoute(builder: (_) => UsersPage());
        }
      case editUserPageRoute:
        {
          var argument = settings.arguments as EditUserPageArguments;
          return MaterialPageRoute(
              builder: (_) => EditUserPage(arguments: argument));
        }

      default:
        {
          return MaterialPageRoute(builder: (_) => HomePage(title: "Home",));
        }
    }
  }
}
