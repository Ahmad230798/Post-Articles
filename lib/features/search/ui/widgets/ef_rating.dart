// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class EFRating extends StatelessWidget {
  final int selectedRating;
  final Function(int)? onSelect;

  const EFRating({super.key, required this.selectedRating, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer Rating",
            style: AppTextStyle.font16boldgray.copyWith(
              color: AppColor.textDark,
            ),
          ),
          SizedBox(height: 16.h),

          Row(
            children: List.generate(5, (i) {
              final stars = i + 1;
              final isSelected = stars == selectedRating;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onSelect?.call(stars),
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: isSelected
                            ? AppColor.accent
                            : AppColor.grey.withOpacity(0.3),
                        width: isSelected ? 2 : 1,
                      ),
                      color: isSelected
                          ? AppColor.accent.withOpacity(0.05)
                          : Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          stars.toString(),
                          style: AppTextStyle.font14regularGrey.copyWith(
                            color: AppColor.textDark,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(Icons.star, size: 14.sp, color: Colors.amber),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
