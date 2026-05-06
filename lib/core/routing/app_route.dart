import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/core/widgets/main_navigation.dart';

import 'package:flutter_project/core/services/api/api_services.dart'
    show ApiServices;
import 'package:flutter_project/core/services/services.dart';
import 'package:flutter_project/features/article_details/ui/article_details_screen.dart';
import 'package:flutter_project/features/auth/logic/cubit/login_cubit.dart';
import 'package:flutter_project/features/auth/logic/cubit/signup_cubit.dart';
import 'package:flutter_project/features/auth/repo/auth_repo.dart';
import 'package:flutter_project/features/auth/ui/login_screen.dart';
import 'package:flutter_project/features/auth/ui/sign_up_screen.dart';
import 'package:flutter_project/features/comments/ui/comments_screen.dart';
import 'package:flutter_project/features/edit_profile/ui/edit_profile.dart';
import 'package:flutter_project/features/explore/explore_screen.dart';
import 'package:flutter_project/features/my_profile/ui/my_profile.dart';
import 'package:flutter_project/features/notification_screen/ui/notification_screen.dart';
import 'package:flutter_project/features/publish/cubit/publish_cubit.dart';
import 'package:flutter_project/features/publish/repo/publish_repository.dart';
import 'package:flutter_project/features/search/ui/explore_filters_screen.dart';
import 'package:flutter_project/features/home/ui/home_screen.dart';
import 'package:flutter_project/features/onboarding/ui/page_controller.dart';
import 'package:flutter_project/features/publish/step1/ui/publish_step1_screen.dart';
import 'package:flutter_project/features/saved/ui/saved_screen.dart';
import 'package:flutter_project/features/setting/ui/setting_screen.dart';
import 'package:flutter_project/features/splash_screen/splash_screen.dart';
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
            create: (_) =>
                LoginCubit(AuthRepo(ApiServices(), SharedPreferencesService())),
            child: LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(
              AuthRepo(ApiServices(), SharedPreferencesService()),
            ),
            child: SignUpScreen(),
          ),
        );
      case Routes.exploreFiltersScreen:
        return MaterialPageRoute(builder: (_) => ExploreFiltersScreen());
      case Routes.publishStep1Screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => PublishCubit(PublishRepository(ApiServices())),
            child: const PublishStep1Screen(),
          ),
        );

      case Routes.commentsScreen:
        final slug = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => CommentsScreen(slug: slug));
      case Routes.savedScreen:
        return MaterialPageRoute(builder: (_) => SavedScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.articleDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const ArticleDetailsScreen(),
          settings: settings,
        );
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.userProfileScreen:
        final username = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => UserProfile(username: username),
        );

      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainNavigation());
      case Routes.myProfileScreen:
        return MaterialPageRoute(builder: (_) => const MyProfile());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfile());
      case Routes.exploreScreen:
        return MaterialPageRoute(builder: (_) => const ExploreScreen());
      case Routes.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
