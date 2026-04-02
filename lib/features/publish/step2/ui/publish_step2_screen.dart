import 'package:flutter/material.dart';
import 'package:flutter_project/features/publish/step3/ui/publish_step3_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/features/publish/shared/pw_header.dart';
import 'package:flutter_project/features/publish/shared/pw_progress.dart';
import 'package:flutter_project/features/publish/shared/pw_section_title.dart';
import 'package:flutter_project/features/publish/shared/pw_text_area.dart';
import 'package:flutter_project/features/publish/shared/pw_footer_buttons.dart';
import '../widgets/step2_media_upload.dart';

class PublishStep2Screen extends StatelessWidget {
  const PublishStep2Screen({super.key});

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
              showBack: true,
              showClose: true,
            ),

            // Progress (dots style)
            const PWProgress(
              step: 2,
              totalSteps: 3,
              style: PWProgressStyle.dots,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Title
                    const PWSectionTitle(
                      title: "Step 2: Content",
                      subtitle: "Enhance your post with high-quality media.",
                    ),

                    SizedBox(height: 12.h),

                    // Media Upload Box (CUSTOM WIDGET)
                    const Step2MediaUpload(),

                    SizedBox(height: 24.h),

                    // Description
                    const PWTextArea(
                      label: "Post Description",
                      hint:
                          "What's on your mind? Add some context to your media...",
                    ),

                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),

            // Footer Buttons
            PWFooterButtons(
              leftText: "Back",
              rightText: "Continue to Step 3",
              onLeftTap: () => Navigator.pop(context),
              onRightTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PublishStep3Screen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
