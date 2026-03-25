import 'package:flutter/material.dart';
import 'package:flutter_project/core/theming/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle font16boldlightblue = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    color: AppColor.lightblue,
  );
  static TextStyle font32bolddarkblue = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xff1A365D),
  );
  static TextStyle font16regularbluewithopacity = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: Color(0xff1A365D).withOpacity(0.8),
  );
  static TextStyle font12regulergray = TextStyle(
    color: AppColor.gray,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    height: 16 / 12.h,
  );
  static TextStyle font14semiboldgray = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
}
