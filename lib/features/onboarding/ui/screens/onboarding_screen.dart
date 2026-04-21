import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/features/onboarding/ui/widgets/onboarding1_image_and_description.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      context.pushNamed(Routes.loginScreen);
                    },
                    child: Text(
                      "Skip",
                      style: AppTextStyle.font16boldlightblue,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.h),
          OnboardingImageAndDescription(
            image: 'onboardingimage1.png',
            maintext: 'Publish Easily',
            discription:
                'Share your content with the world in just a\n few taps. Simple, fast, and intuitive tools\ndesigned for creators like you.',
          ),
        ],
      ),
    );
  }
}
