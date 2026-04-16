import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/publish/step1/widgets/step1_cover_upload.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/features/publish/cubit/publish_cubit.dart';
import 'package:flutter_project/features/publish/cubit/publish_state.dart';
import 'package:flutter_project/features/publish/shared/pw_header.dart';
import 'package:flutter_project/features/publish/shared/pw_progress.dart';
import 'package:flutter_project/features/publish/shared/pw_section_title.dart';
import 'package:flutter_project/features/publish/shared/pw_text_field.dart';
import 'package:flutter_project/features/publish/shared/pw_text_area.dart';
import 'package:flutter_project/features/publish/step2/ui/publish_step2_screen.dart';

class PublishStep1Screen extends StatefulWidget {
  const PublishStep1Screen({super.key});

  @override
  State<PublishStep1Screen> createState() => _PublishStep1ScreenState();
}

class _PublishStep1ScreenState extends State<PublishStep1Screen> {
  @override
  void initState() {
    super.initState();
    context.read<PublishCubit>().loadCategories();
  }

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
              showBack: false,
              showClose: true,
            ),

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
                    const PWSectionTitle(title: "Basic Information"),

                    SizedBox(height: 12.h),

                    PWTextField(
                      label: "Title",
                      hint: "Enter a title...",
                      onChanged: cubit.updateTitle,
                    ),

                    PWTextArea(
                      label: "Description",
                      hint: "Short description...",
                      onChanged: cubit.updateDescription,
                    ),

                    PWTextArea(
                      label: "Abstract",
                      hint: "Academic abstract...",
                      onChanged: cubit.updateAbstract,
                    ),

                    SizedBox(height: 20.h),

                    BlocBuilder<PublishCubit, PublishState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: cubit.pickCoverImage,
                          child: state.coverImage == null
                              ? const Step1CoverUpload()
                              : Container(
                                  height: 180.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    image: DecorationImage(
                                      image: FileImage(state.coverImage!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),

                    SizedBox(height: 20.h),

                    BlocBuilder<PublishCubit, PublishState>(
                      builder: (context, state) {
                        final categories = cubit.categories;

                        if (categories.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return DropdownButtonFormField<int>(
                          value: state.categoryId,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          hint: const Text("Select Category"),
                          items: categories.map((cat) {
                            return DropdownMenuItem<int>(
                              value: cat['id'] as int,
                              child: Text(cat['name'].toString()),
                            );
                          }).toList(),
                          onChanged: cubit.updateCategory,
                        );
                      },
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
                        child: const PublishStep2Screen(),
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
                    "Next",
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
