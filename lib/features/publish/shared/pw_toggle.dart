// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';

class PWToggle extends StatelessWidget {
  final bool value;

  const PWToggle({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 26.h,
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: value ? AppColor.accent : AppColor.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Align(
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 20.w,
          height: 20.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}
