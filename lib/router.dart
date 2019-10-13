import 'package:flutter/material.dart';
import 'package:fluttertinity/edit_user_page.dart';
import 'package:fluttertinity/main.dart';

class RouterManager {
  static const String homePageRoute = '/';
  static const String editUserPageRoute = '/edit';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        {
          return MaterialPageRoute(builder: (_) => MyHomePage());
        }
      case editUserPageRoute:
        {
          var argument = settings.arguments as EditUserPageArguments;
          return MaterialPageRoute(
              builder: (_) => EditUserPage(arguments: argument));
        }

      default:
        {
          return MaterialPageRoute(builder: (_) => MyHomePage());
        }
    }
  }
}
