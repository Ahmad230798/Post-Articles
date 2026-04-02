import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/features/publish/shared/pw_header.dart';
import 'package:flutter_project/features/publish/shared/pw_progress.dart';
import 'package:flutter_project/features/publish/shared/pw_section_title.dart';
import 'package:flutter_project/features/publish/shared/pw_footer_buttons.dart';
import '../widgets/step3_preview_card.dart';
import '../widgets/step3_visibility_section.dart';
import '../widgets/step3_author_info.dart';

class PublishStep3Screen extends StatelessWidget {
  const PublishStep3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            const PWHeader(
              title: "Publish Wizard",
              showBack: true,
              showClose: false,
            ),

            const PWProgress(
              step: 3,
              totalSteps: 3,
              style: PWProgressStyle.dots,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PWSectionTitle(
                      title: "Final Review",
                      subtitle:
                          "Last step! Double check everything before going live.",
                    ),

                    const Step3PreviewCard(),
                    SizedBox(height: 24.h),

                    const Step3VisibilitySection(),
                    SizedBox(height: 24.h),

                    const Step3AuthorInfo(),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),

            PWFooterButtons(
              leftText: "Save as Draft",
              rightText: "Submit Post",
              onLeftTap: () => Navigator.pop(context),
              onRightTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
