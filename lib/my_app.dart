import 'package:flutter/material.dart';
import 'package:flutter_project/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 916),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        home: OnboardingScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
