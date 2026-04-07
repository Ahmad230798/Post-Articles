// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class EFSearchBar extends StatelessWidget {
  final Function(String)? onChanged;

  const EFSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColor.grey.withOpacity(0.3)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(width: 12.w),
            Icon(Icons.search, color: AppColor.grey, size: 22.sp),
            SizedBox(width: 12.w),

            Expanded(
              child: TextField(
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: "Search for items, brands...",
                  hintStyle: AppTextStyle.font14regularGrey,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
