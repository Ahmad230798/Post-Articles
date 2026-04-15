import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class ADBodyContent extends StatelessWidget {
  final String description;
  final String abstractText;

  const ADBodyContent({
    super.key,
    required this.description,
    required this.abstractText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            abstractText,
            style: AppTextStyle.font14regularGrey.copyWith(
              color: AppColor.textDark,
              fontSize: 15.sp,
              height: 1.5,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            style: AppTextStyle.font14regularGrey.copyWith(
              color: AppColor.textDark,
              fontSize: 15.sp,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
