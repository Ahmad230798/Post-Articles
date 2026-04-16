import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/features/publish/cubit/publish_cubit.dart';
import 'package:flutter_project/features/publish/cubit/publish_state.dart';

class Step3PreviewCard extends StatelessWidget {
  const Step3PreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PublishCubit, PublishState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColor.accent.withOpacity(0.1)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Cover Image
              Container(
                height: 180.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                  image: DecorationImage(
                    image: state.coverImage != null
                        ? FileImage(state.coverImage!)
                        : const NetworkImage(
                                "https://images.unsplash.com/photo-1501785888041-af3ef285b470",
                              )
                              as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Content
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.title.isEmpty ? "Draft Preview" : state.title,
                      style: AppTextStyle.font16boldgray.copyWith(
                        fontSize: 20.sp,
                        color: AppColor.textDark,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Text(
                      state.description.isEmpty
                          ? "No description added."
                          : state.description,
                      style: AppTextStyle.font14regularGrey.copyWith(
                        color: AppColor.textDark.withOpacity(0.8),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    if (state.location.isNotEmpty)
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16.sp,
                            color: AppColor.grey,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            state.location,
                            style: AppTextStyle.font14regularGrey.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
