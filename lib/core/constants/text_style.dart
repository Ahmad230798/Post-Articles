import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/app_font.dart';
import 'package:flutter_project/core/theming/font_weight_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle font16boldlightblue = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 16.sp,
    color: AppColor.lightblue,
  );

  static TextStyle font16boldgray = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 16.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.darkblue,
  );
  static TextStyle font16boldwhite = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 16.sp,
    fontFamily: AppFont.lexend,
    color: Colors.white,
  );
  static TextStyle font24bolddark = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 24.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.textDark,
  );
  static TextStyle font24boldgreen = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 24.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.green,
  );
  static TextStyle font14regulardarkblue = TextStyle(
    fontWeight: FontWeightHelper.normal,
    fontSize: 14.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.darkblue,
  );
  static TextStyle font12regulardarkblue = TextStyle(
    fontWeight: FontWeightHelper.medium,
    fontSize: 12.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.darkblue,
  );
  static TextStyle font12regulargreen = TextStyle(
    fontWeight: FontWeightHelper.medium,
    fontSize: 12.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.green,
  );
  static TextStyle font14meduimbluegray = TextStyle(
    fontWeight: FontWeightHelper.medium,
    fontSize: 14.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.blueGrey,
  );
  static TextStyle font14bolddarkblue = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 14.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.darkblue,
  );
  static TextStyle font16regularlightgray = TextStyle(
    fontWeight: FontWeightHelper.normal,
    fontSize: 16.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.lightgrey,
  );

  static TextStyle font20boldPrimary = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFont.lexend,
    color: AppColor.primary,
  );

  static TextStyle font32bolddarkblue = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFont.lexend,
    color: Color(0xff1A365D),
  );

  static TextStyle font16regularbluewithopacity = TextStyle(
    fontWeight: FontWeightHelper.normal,
    fontSize: 16.sp,
    fontFamily: AppFont.lexend,
    color: AppColor.darkblue.withOpacity(0.8),
  );

  static TextStyle font10boldWhite = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFont.lexend,
    color: Colors.white,
  );

  static TextStyle font20boldWhite = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFont.lexend,
    color: Colors.white,
  );
  static TextStyle font30boldblack = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: AppFont.lexend,
    color: AppColor.textDark,
  );

  static TextStyle font12regularWhite70 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.normal,
    fontFamily: AppFont.lexend,
    color: Colors.white70,
  );

  static TextStyle font12regulergray = TextStyle(
    color: AppColor.grey,
    fontWeight: FontWeightHelper.normal,
    fontFamily: AppFont.lexend,
    fontSize: 12.sp,
    height: 16 / 12.h,
  );
  static TextStyle font12meduimlightgray = TextStyle(
    color: AppColor.lightgrey,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppFont.lexend,
    fontSize: 12.sp,
    height: 16 / 12.h,
  );

  static TextStyle font14regularGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.normal,
    color: AppColor.grey,
    fontFamily: "Lexend",
  );

  static TextStyle font14semibolddark = TextStyle(
    color: Colors.black,
    fontWeight: FontWeightHelper.semibold,
    fontSize: 14.sp,
  );

  static TextStyle font14semiboldbluegray = TextStyle(
    color: AppColor.blueGrey,
    fontWeight: FontWeightHelper.semibold,
    fontSize: 14.sp,
    fontFamily: AppFont.lexend,
  );
  static TextStyle font18boldlightblue = TextStyle(
    fontSize: 18.sp,
    color: AppColor.primary,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font18boldwhite = TextStyle(
    fontFamily: AppFont.lexend,
    fontSize: 18.sp,
    color: Colors.white,
    wordSpacing: -0.45,
    height: 28 / 18,
    fontWeight: FontWeightHelper.bold,
  );
}
