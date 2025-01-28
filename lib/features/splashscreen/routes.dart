import 'package:app/features/List_Your_Wall/presentations/pages/list_your_wall.dart';
import 'package:app/features/authentication/presentation/screens/login_body.dart';
import 'package:app/features/authentication/presentation/screens/signup_body.dart';
import 'package:app/features/available_walls/presentations/pages/available_walls_page.dart';
import 'package:app/features/splashscreen/screens/splash_screen.dart';
import 'package:app/features/your_wall/presentations/pages/your_wall.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Route names
  static const String home = '/';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String profile = '/profile';

  // Route generator function
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => YourWallPage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginBody());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpBody());
    
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('404: Page not found'),
            ),
          ),
        );
    }
  }
}
