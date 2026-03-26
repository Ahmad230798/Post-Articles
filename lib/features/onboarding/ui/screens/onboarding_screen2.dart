import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/features/onboarding/ui/widgets/onboarding1_image_and_description.dart';
import 'package:flutter_project/features/onboarding/ui/widgets/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                      style: AppTextStyle.font16boldlightblue,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            OnboardingImageAndDescription(
              image: 'laptop_background.png',
              maintext: 'Publish Easily',
              discription:
                  'Share your content with the world in just a\n few taps. Simple, fast, and intuitive tools\ndesigned for creators like you.',
            ),
            Services(),
          ],
        ),
      ),
    );
  }
}
