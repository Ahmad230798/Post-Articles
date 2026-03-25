import 'package:flutter/material.dart';
import 'package:flutter_project/core/theming/style.dart';
import 'package:flutter_project/features/onboarding/ui/widgets/feature_card.dart';
import 'package:flutter_project/features/onboarding/ui/widgets/onboarding1_image_and_description.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

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
            image: 'onboarding3image.png',
            maintext: 'Collaborate & Grow',
            discription:
                'Connect with industry leaders, share unique\ninsights, and scale your business with our\ncommunity-driven tools and networking\nfeatures.',
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              FeatureCard(
                title: "Industry\nNetworking",
                icon: Icons.groups_2_outlined,
              ),
              SizedBox(width: 16.w),
              FeatureCard(title: "Shared Insights", icon: Icons.share_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
