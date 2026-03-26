import 'package:flutter/material.dart';
import 'package:flutter_project/core/routing/app_route.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/core/theming/color.dart';
import 'package:flutter_project/features/onboarding/ui/page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 914),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        home: OnboardingContainer(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColor.backgroundcolor),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRoute.generateRoute,
      ),
    );
  }
}
