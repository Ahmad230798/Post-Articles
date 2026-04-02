import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class PWSectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const PWSectionTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.font16boldgray.copyWith(
              fontSize: 26.sp,
              color: AppColor.textDark,
            ),
          ),
          if (subtitle != null) ...[
            SizedBox(height: 6.h),
            Text(subtitle!, style: AppTextStyle.font14regularGrey),
          ],
        ],
      ),
    );
  }
}
