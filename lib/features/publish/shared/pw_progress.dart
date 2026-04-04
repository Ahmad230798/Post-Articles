// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';

enum PWProgressStyle { bar, dots }

class PWProgress extends StatelessWidget {
  final int step;
  final int totalSteps;
  final PWProgressStyle style;

  const PWProgress({
    super.key,
    required this.step,
    required this.totalSteps,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    if (style == PWProgressStyle.bar) {
      double percent = (step / totalSteps);
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        height: 10.h,
        decoration: BoxDecoration(
          color: AppColor.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: percent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: AppColor.accent,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
      );
    }

    // Dots style
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (i) {
        bool active = (i + 1) == step;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 8.h,
          width: active ? 30.w : 8.w,
          decoration: BoxDecoration(
            color: active ? AppColor.accent : AppColor.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20.r),
          ),
        );
      }),
    );
  }
}
