// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class EFSortBy extends StatelessWidget {
  final String selected;
  final Function(String)? onSelect;

  const EFSortBy({super.key, required this.selected, this.onSelect});

  @override
  Widget build(BuildContext context) {
    final options = ["Most Relevant", "Newest Arrivals"];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sort By",
            style: AppTextStyle.font16boldgray.copyWith(
              color: AppColor.textDark,
            ),
          ),
          SizedBox(height: 16.h),

          ...options.map((label) {
            final isSelected = label == selected;

            return GestureDetector(
              onTap: () => onSelect?.call(label),
              child: Container(
                margin: EdgeInsets.only(bottom: 12.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: isSelected
                        ? AppColor.accent
                        : AppColor.grey.withOpacity(0.3),
                  ),
                  color: isSelected
                      ? AppColor.accent.withOpacity(0.05)
                      : Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: AppTextStyle.font14regularGrey.copyWith(
                        color: isSelected ? AppColor.textDark : AppColor.grey,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    Container(
                      height: 20.h,
                      width: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? AppColor.accent : AppColor.grey,
                          width: 2,
                        ),
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                height: 10.h,
                                width: 10.h,
                                decoration: BoxDecoration(
                                  color: AppColor.accent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
