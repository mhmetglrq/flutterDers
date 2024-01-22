import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/routes/route_names.dart';
import 'package:flutter_application_1/create_user.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/profile.dart';

class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(
          const MyHomePage(title: ""),
        );
      case RouteNames.home:
        var arguments = settings.arguments as Map<String, dynamic>;
        final userModel = arguments['userModel'] as UserModel;
        return _materialRoute(
          Home(
            userModel: userModel,
          ),
        );
      case RouteNames.createUser:
        return _materialRoute(const CreateUser());

      case RouteNames.profile:
        var arguments = settings.arguments as Map<String, dynamic>;
        UserModel userModel = arguments["userModel"];
        return _materialRoute(
          Profile(userModel: userModel),
        );

      default:
        return _materialRoute(
          const MyHomePage(
            title: "",
          ),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
