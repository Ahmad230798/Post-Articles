import 'package:flutter/material.dart';
import 'package:flutter_project/features/article_details/ui/article_details_screen.dart';
import 'package:flutter_project/features/home/ui/home_screen.dart';
import 'package:flutter_project/features/onboarding/ui/page_controller.dart';

class AppRoutes {
  static const String home = '/home';
  static const String onBoarding = '/onboarding';
  static const String articleDetails = '/article-details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case onBoarding:
        return MaterialPageRoute(builder: (_) => OnboardingContainer());

      case articleDetails:
        return MaterialPageRoute(builder: (_) => const ArticleDetailsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
