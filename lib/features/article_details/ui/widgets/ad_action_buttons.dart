// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class ADActionsButtons extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback onBookmark;
  final VoidCallback onCite;
  final VoidCallback onLike;

  const ADActionsButtons({
    super.key,
    required this.isBookmarked,
    required this.onBookmark,
    required this.onCite,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          _actionButton(Icons.picture_as_pdf, "Download PDF", () {}),
          SizedBox(width: 12.w),
          _actionButton(Icons.format_quote, "Cite", onCite),
          SizedBox(width: 12.w),
          _actionButton(
            isBookmarked ? Icons.favorite : Icons.favorite_border,
            isBookmarked ? "Liked" : "Like",
            onBookmark,
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColor.accent,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 22.sp),
              SizedBox(height: 6.h),
              Text(
                label,
                style: AppTextStyle.font12regularWhite70.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
