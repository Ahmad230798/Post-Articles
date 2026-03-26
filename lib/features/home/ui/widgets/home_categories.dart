import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      "Featured",
      "Technology",
      "Health",
      "Science",
      "Business",
    ];

    return SizedBox(
      height: 55.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          final isActive = index == 0;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                categories[index],
                style: isActive
                    ? AppTextStyle.font16boldgray.copyWith(
                        color: AppColor.primary,
                      )
                    : AppTextStyle.font16regularbluewithopacity,
              ),
              SizedBox(height: 4.h),
              if (isActive)
                Container(height: 3.h, width: 30.w, color: AppColor.primary),
            ],
          );
        },
        separatorBuilder: (_, __) => SizedBox(width: 24.w),
        itemCount: categories.length,
      ),
    );
  }
}
