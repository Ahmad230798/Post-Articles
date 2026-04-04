// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class PWHeader extends StatelessWidget {
  final bool showBack;
  final bool showClose;
  final String title;

  const PWHeader({
    super.key,
    this.showBack = false,
    this.showClose = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColor.grey.withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: [
          // Back Button
          SizedBox(
            width: 40.w,
            child: showBack
                ? GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColor.textDark,
                      size: 22.sp,
                    ),
                  )
                : const SizedBox(),
          ),

          // Title
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.font16boldgray.copyWith(
                fontSize: 18.sp,
                color: AppColor.textDark,
              ),
            ),
          ),

          // Close Button
          SizedBox(
            width: 40.w,
            child: showClose
                ? GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: AppColor.textDark,
                      size: 22.sp,
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
