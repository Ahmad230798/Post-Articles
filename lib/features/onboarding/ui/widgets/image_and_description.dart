import 'package:flutter/material.dart';
import 'package:flutter_project/core/theming/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageAndDescription extends StatelessWidget {
  const ImageAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/onboardingimage1.png"),
        SizedBox(height: 32.h),
        Text(
          textAlign: TextAlign.center,
          "Discover Cutting-\nEdge Research",
          style: AppTextStyle.font32bolddarkblue,
        ),
        SizedBox(height: 10.h),
        Text(
          "Access a vast library of high-quality\nscientific papers and journals from around\nthe globe at your fingertips.",
          textAlign: TextAlign.center,
          style: AppTextStyle.font16regularbluewithopacity,
        ),
      ],
    );
  }
}
