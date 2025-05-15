import 'package:flutter/material.dart';
import 'package:pets_app/core/routes/routes.dart';
import 'package:pets_app/features/auth/presentation/view/register.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      // case Routes.login:
      //   return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'No Route Found',
          ),
        ),
        body: const Center(
          child: Text('No Route Found'),
        ),
      ),
    );
  }
}
