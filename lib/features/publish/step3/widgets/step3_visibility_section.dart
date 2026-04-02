// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/features/publish/shared/pw_tag_chip.dart';
import 'package:flutter_project/features/publish/shared/pw_toggle.dart';

class Step3VisibilitySection extends StatelessWidget {
  const Step3VisibilitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Visibility Row
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColor.accent.withOpacity(0.1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.public, color: AppColor.accent),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Public Access",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.textDark,
                        ),
                      ),
                      Text(
                        "Visible to everyone on the platform",
                        style: TextStyle(fontSize: 12.sp, color: AppColor.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const PWToggle(value: true),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // Tags
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: const [
            PWTagChip(label: "#adventure"),
            PWTagChip(label: "#photography"),
            PWTagChip(label: "#hiking"),
            PWTagChip(label: "Add tag", isAddButton: true),
          ],
        ),
      ],
    );
  }
}
