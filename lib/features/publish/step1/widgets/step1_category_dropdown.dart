// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';

class Step1CategoryDropdown extends StatefulWidget {
  const Step1CategoryDropdown({super.key});

  @override
  State<Step1CategoryDropdown> createState() => _Step1CategoryDropdownState();
}

class _Step1CategoryDropdownState extends State<Step1CategoryDropdown> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.textDark,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColor.grey.withOpacity(0.3)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selected,
              hint: Text(
                "Select a category",
                style: TextStyle(color: AppColor.grey),
              ),
              items: const [
                DropdownMenuItem(value: "tech", child: Text("Technology")),
                DropdownMenuItem(value: "art", child: Text("Digital Art")),
                DropdownMenuItem(value: "education", child: Text("Education")),
                DropdownMenuItem(value: "lifestyle", child: Text("Lifestyle")),
              ],
              onChanged: (value) {
                setState(() => selected = value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
