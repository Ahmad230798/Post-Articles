import 'package:flutter/material.dart';
import 'package:flutter_project/features/onboarding/ui/page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 914),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        home: OnboardingContainer(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
