// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_project/features/publish/step2/ui/publish_step2_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/features/publish/shared/pw_header.dart';
import 'package:flutter_project/features/publish/shared/pw_progress.dart';
import 'package:flutter_project/features/publish/shared/pw_section_title.dart';
import 'package:flutter_project/features/publish/shared/pw_text_field.dart';
import 'package:flutter_project/features/publish/shared/pw_text_area.dart';
import 'package:flutter_project/features/publish/shared/pw_upload_box.dart';
import 'package:flutter_project/features/publish/shared/pw_footer_buttons.dart';

class PublishStep1Screen extends StatelessWidget {
  const PublishStep1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            const PWHeader(
              title: "Publish Wizard",
              showBack: false,
              showClose: true,
            ),

            // Progress bar (Step 1 of 3)
            const PWProgress(
              step: 1,
              totalSteps: 3,
              style: PWProgressStyle.dots,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section title
                    const PWSectionTitle(title: "Tell us about your project"),

                    SizedBox(height: 12.h),

                    // Project Title
                    const PWTextField(
                      label: "Project Title",
                      hint: "Enter a catchy name for your masterpiece",
                    ),

                    SizedBox(height: 4.h),
                    Text(
                      "Tip: Keep it short and memorable.",
                      style: TextStyle(color: AppColor.grey, fontSize: 12.sp),
                    ),

                    SizedBox(height: 20.h),

                    // Description
                    const PWTextArea(
                      label: "Description",
                      hint:
                          "Describe what you are publishing. Share the story behind it, its goals, and why people should care...",
                    ),

                    SizedBox(height: 20.h),

                    // Cover Image Upload
                    const PWUploadBox(
                      icon: Icons.add_photo_alternate,
                      title: "Click to upload or drag and drop",
                      subtitle: "PNG, JPG, or WebP (max 5MB)",
                      buttonText: "Upload Cover",
                    ),

                    SizedBox(height: 20.h),

                    // Category Dropdown (custom widget)
                    _categoryDropdown(),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),

            // Footer Buttons
            PWFooterButtons(
              leftText: "Save Draft",
              rightText: "Next",
              onLeftTap: () {},
              onRightTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PublishStep2Screen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryDropdown() {
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
              value: null,
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
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}
