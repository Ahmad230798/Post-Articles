import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/DI/dependency_injection.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/core/widgets/main_navigation.dart';

import 'package:flutter_project/features/article_details/ui/article_details_screen.dart';
import 'package:flutter_project/features/auth/logic/cubit/login_cubit.dart';

import 'package:flutter_project/features/auth/ui/login_screen.dart';
import 'package:flutter_project/features/comments/ui/comments_screen.dart';
import 'package:flutter_project/features/search/ui/explore_filters_screen.dart';
import 'package:flutter_project/features/home/ui/home_screen.dart';
import 'package:flutter_project/features/onboarding/ui/page_controller.dart';
import 'package:flutter_project/features/publish/step1/ui/publish_step1_screen.dart';
import 'package:flutter_project/features/saved/ui/saved_screen.dart';
import 'package:flutter_project/features/auth/ui/sign_up_screen.dart';
import 'package:flutter_project/features/setting/ui/setting_screen.dart';
import 'package:flutter_project/features/user_profile/ui/user_profile.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingContainer());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.exploreFiltersScreen:
        return MaterialPageRoute(builder: (_) => ExploreFiltersScreen());
      case Routes.publishStep1Screen:
        return MaterialPageRoute(builder: (_) => PublishStep1Screen());
      case Routes.commentsScreen:
        return MaterialPageRoute(builder: (_) => CommentsScreen());
      case Routes.savedScreen:
        return MaterialPageRoute(builder: (_) => SavedScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.articleDetailsScreen:
        return MaterialPageRoute(builder: (_) => ArticleDetailsScreen());
      case Routes.userProfileScreen:
        return MaterialPageRoute(builder: (_) => UserProfile());
      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainNavigation());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
