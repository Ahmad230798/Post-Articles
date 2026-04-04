// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class PWTagChip extends StatelessWidget {
  final String label;
  final bool isAddButton;

  const PWTagChip({super.key, required this.label, this.isAddButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isAddButton
            ? AppColor.grey.withOpacity(0.1)
            : AppColor.accent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isAddButton
              ? AppColor.grey.withOpacity(0.3)
              : AppColor.accent.withOpacity(0.3),
          style: isAddButton ? BorderStyle.solid : BorderStyle.solid,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isAddButton) Icon(Icons.add, size: 16.sp, color: AppColor.grey),
          if (isAddButton) SizedBox(width: 4.w),
          Text(
            label,
            style: AppTextStyle.font14regularGrey.copyWith(
              color: isAddButton ? AppColor.grey : AppColor.accent,
            ),
          ),
        ],
      ),
    );
  }
}
