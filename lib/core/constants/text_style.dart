import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/app_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle font16boldlightblue = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    color: AppColor.lightblue,
  );

  static TextStyle font16boldgray = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.darkblue,
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
    color:AppColor.darkblue.withOpacity(0.8),
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

  static TextStyle font12regulergray = TextStyle(
    color: AppColor.darkblue,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    height: 16 / 12.h,
  );

  static TextStyle font14regularGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.grey,
    fontFamily: "Lexend",
  );

  static TextStyle font14semiboldgray = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
}
