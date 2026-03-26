import 'package:flutter/material.dart';
import 'package:flutter_project/features/home/ui/home_screen.dart';
import 'package:flutter_project/features/onboarding/ui/page_controller.dart';

class AppRoutes {
  static const String home = '/home';
  static const String onBoarding = '/onboarding';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingContainer());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
