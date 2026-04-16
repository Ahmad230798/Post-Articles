import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/publish/step2/widgets/step2_media_upload.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/features/publish/cubit/publish_cubit.dart';
import 'package:flutter_project/features/publish/shared/pw_header.dart';
import 'package:flutter_project/features/publish/shared/pw_progress.dart';
import 'package:flutter_project/features/publish/shared/pw_section_title.dart';
import 'package:flutter_project/features/publish/shared/pw_text_area.dart';
import 'package:flutter_project/features/publish/shared/pw_text_field.dart';
import 'package:flutter_project/features/publish/step3/ui/publish_step3_screen.dart';

class PublishStep2Screen extends StatelessWidget {
  const PublishStep2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PublishCubit>();

    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            const PWHeader(
              title: "Publish Wizard",
              showBack: true,
              showClose: true,
            ),

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
                    const PWSectionTitle(
                      title: "Content & Media",
                      subtitle: "Add your full article content",
                    ),

                    PWTextArea(
                      label: "Full Content",
                      hint: "Write your full article...",
                      onChanged: cubit.updateContent,
                    ),

                    SizedBox(height: 20.h),

                    GestureDetector(
                      onTap: cubit.pickPdfFile,
                      child: const Step2MediaUpload(),
                    ),

                    SizedBox(height: 20.h),

                    PWTextField(
                      label: "Tags",
                      hint: "ai, flutter, research",
                      onChanged: cubit.updateTagsString,
                    ),

                    PWTextField(
                      label: "Location",
                      hint: "Amsterdam, NL",
                      onChanged: cubit.updateLocation,
                    ),

                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: cubit,
                        child: const PublishStep3Screen(),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 24.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.accent,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
