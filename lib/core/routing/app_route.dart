import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/DI/dependency_injection.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/features/auth/logic/cubit/login_cubit.dart';
import 'package:flutter_project/features/auth/ui/login_screen.dart';
import 'package:flutter_project/features/auth/ui/sign_up_screen.dart';
import 'package:flutter_project/features/onboarding/ui/page_controller.dart';
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
      case Routes.userProfileScreen:
        return MaterialPageRoute(builder: (_) => UserProfile());
      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
