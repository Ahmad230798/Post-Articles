import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/app_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle font16boldgray = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.gray,
  );

  static TextStyle font20boldPrimary = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.lexend,
    color: AppColor.primary,
  );

  static TextStyle font32bolddarkblue = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.lexend,
    color: Color(0xff1A365D),
  );

  static TextStyle font16regularbluewithopacity = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    fontFamily: AppFont.lexend,
    color: Color(0xff1A365D).withOpacity(0.8),
  );

  static TextStyle font10boldWhite = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.lexend,
    color: Colors.white,
  );

  static TextStyle font20boldWhite = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.lexend,
    color: Colors.white,
  );

  static TextStyle font12regularWhite70 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppFont.lexend,
    color: Colors.white70,
  );
}
