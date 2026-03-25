import 'package:flutter/material.dart';
import 'package:flutter_project/core/theming/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingImageAndDescription extends StatelessWidget {
  final String image;
  final String maintext;
  final String discription;
  const OnboardingImageAndDescription({super.key, required this.image, required this.maintext, required this.discription});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/$image"),
        SizedBox(height: 15.h),
        Text(
          textAlign: TextAlign.center,
          maintext,
          style: AppTextStyle.font32bolddarkblue,
        ),
        SizedBox(height: 4.h),
        Text(
          discription,
          textAlign: TextAlign.center,
          style: AppTextStyle.font16regularbluewithopacity,
        ),
      ],
    );
  }
}
