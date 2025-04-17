import 'package:flutter/material.dart';
import 'package:pets_app/core/routes/routes.dart';
import 'package:pets_app/features/auth/presentation/view/emailcheck.dart';
import 'package:pets_app/features/auth/presentation/view/login.dart';
import 'package:pets_app/features/auth/presentation/view/newPassword.dart';
import 'package:pets_app/features/auth/presentation/view/register.dart';
import 'package:pets_app/features/auth/presentation/view/start_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const Login());
      case Routes.startScreen:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.emailCheck:
        return MaterialPageRoute(builder: (_) => const Emailcheck());
            case Routes.updatePassword:
        return MaterialPageRoute(builder: (_) => const Newpassword());

      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
