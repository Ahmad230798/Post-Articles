import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 916),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.articleDetails, // أو AppRoutes.onBoarding
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
