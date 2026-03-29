import 'package:flutter/material.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/features/auth/ui/login_screen.dart';
import 'package:flutter_project/features/auth/ui/sign_up_screen.dart';
import 'package:flutter_project/features/onboarding/ui/page_controller.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingContainer());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
