import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/routes/route_names.dart';
import 'package:flutter_application_1/core/models/user.dart';
import 'package:flutter_application_1/features/auth/view/sign_in.dart';
import 'package:flutter_application_1/features/bottomNavbar/view/bottom_navbar.dart';
import 'package:flutter_application_1/features/home/view/home.dart';
import 'package:flutter_application_1/features/profile/view/profile.dart';

import '../../features/auth/view/sign_up.dart';

class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(
          const SignIn(),
        );
      case RouteNames.home:
        final arguments = settings.arguments as Map<String, dynamic>;
        final userModel = arguments["userModel"] as UserModel;
        return _materialRoute(
          Home(
            userModel: userModel,
          ),
        );

      //Auth
      case RouteNames.signIn:
        return _materialRoute(
          const SignIn(),
        );
      case RouteNames.signUp:
        return _materialRoute(
          const SignUp(),
        );

      case RouteNames.bottomNavbar:
        final arguments = settings.arguments as Map<String, dynamic>;
        final userModel = arguments["userModel"] as UserModel;
        return _materialRoute(
          BottomNavbar(
            userModel: userModel,
          ),
        );

      case RouteNames.profile:
        return _materialRoute(
          const Profile(),
        );

      default:
        return _materialRoute(
          const SignIn(),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
