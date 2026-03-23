import 'package:flutter/material.dart';
import 'package:flutter_project/core/theming/style.dart';
import 'package:flutter_project/features/onboarding/ui/widgets/button_and_transition.dart';
import 'package:flutter_project/features/onboarding/ui/widgets/image_and_description.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Text(
                      "Skip",
                      style: AppTextStyle.font16boldgray,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            ImageAndDescription(),
            SizedBox(height: 32.h),
            SizedBox(
              height: 50, // مهم جداً
              child: ButtonAndTransition(),
            ),
          ],
        ),
      ),
    );
  }
}
