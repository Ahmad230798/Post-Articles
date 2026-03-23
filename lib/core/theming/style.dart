import 'package:flutter/material.dart';
import 'package:flutter_project/core/theming/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle font16boldgray = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    color: AppColor.gray,
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
}
