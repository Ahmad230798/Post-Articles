import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/features/publish/cubit/publish_cubit.dart';
import 'package:flutter_project/features/publish/cubit/publish_state.dart';
import 'package:flutter_project/features/publish/shared/pw_header.dart';
import 'package:flutter_project/features/publish/shared/pw_progress.dart';
import 'package:flutter_project/features/publish/shared/pw_section_title.dart';

class PublishStep3Screen extends StatelessWidget {
  const PublishStep3Screen({super.key});

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
                child: BlocBuilder<PublishCubit, PublishState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PWSectionTitle(
                          title: "Final Review",
                          subtitle: "Check everything before publishing",
                        ),

                        // Preview
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state.coverImage != null)
                                Container(
                                  height: 160.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    image: DecorationImage(
                                      image: FileImage(state.coverImage!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                              SizedBox(height: 12.h),

                              Text(
                                state.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 8.h),

                              Text(state.description),
                              SizedBox(height: 8.h),
                              Text("Location: ${state.location}"),
                            ],
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Status
                        DropdownButtonFormField<String>(
                          value: state.status,
                          items: const [
                            DropdownMenuItem(
                              value: "draft",
                              child: Text("Draft"),
                            ),
                            DropdownMenuItem(
                              value: "published",
                              child: Text("Published"),
                            ),
                            DropdownMenuItem(
                              value: "under_review",
                              child: Text("Under Review"),
                            ),
                          ],
                          onChanged: cubit.updateStatus,
                          decoration: const InputDecoration(
                            labelText: "Status",
                          ),
                        ),

                        SizedBox(height: 20.h),

                        // Access Level
                        DropdownButtonFormField<String>(
                          value: state.accessLevel,
                          items: const [
                            DropdownMenuItem(
                              value: "public",
                              child: Text("Public"),
                            ),
                            DropdownMenuItem(
                              value: "private",
                              child: Text("Private"),
                            ),
                            DropdownMenuItem(
                              value: "institutional",
                              child: Text("Institutional"),
                            ),
                          ],
                          onChanged: cubit.updateAccessLevel,
                          decoration: const InputDecoration(
                            labelText: "Access Level",
                          ),
                        ),

                        SizedBox(height: 40.h),
                      ],
                    );
                  },
                ),
              ),
            ),

            BlocConsumer<PublishCubit, PublishState>(
              listener: (context, state) {
                if (state.isSubmitted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Article Submitted Successfully"),
                    ),
                  );
                  Navigator.pop(context);
                }

                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: GestureDetector(
                    onTap: state.isLoading ? null : cubit.submit,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 24.w,
                      ),
                      decoration: BoxDecoration(
                        color: state.isLoading ? Colors.grey : AppColor.accent,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        state.isLoading ? "Submitting..." : "Submit",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
