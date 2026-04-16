import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/features/publish/cubit/publish_cubit.dart';
import 'package:flutter_project/features/publish/cubit/publish_state.dart';
import 'package:flutter_project/features/publish/shared/pw_tag_chip.dart';
import 'package:flutter_project/features/publish/shared/pw_toggle.dart';

class Step3VisibilitySection extends StatelessWidget {
  const Step3VisibilitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PublishCubit, PublishState>(
      builder: (context, state) {
        final cubit = context.read<PublishCubit>();

        final isPublic = state.accessLevel == "public";

        final tagsList = state.tagsString.isEmpty
            ? []
            : state.tagsString.split(",").map((e) => e.trim()).toList();

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
                            "Visible to everyone",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  PWToggle(
                    value: isPublic,
                    onToggle: () {
                      cubit.updateAccessLevel(isPublic ? "private" : "public");
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Tags
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                for (final tag in tagsList) PWTagChip(label: "#$tag"),

                const PWTagChip(label: "Add tags in Step 2", isAddButton: true),
              ],
            ),

            SizedBox(height: 16.h),

            // Location
            if (state.location.isNotEmpty)
              Row(
                children: [
                  Icon(Icons.location_on, size: 18.sp, color: AppColor.grey),
                  SizedBox(width: 6.w),
                  Text(
                    state.location,
                    style: TextStyle(fontSize: 14.sp, color: AppColor.textDark),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
