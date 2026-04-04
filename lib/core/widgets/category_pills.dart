import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_color.dart';
import '../constants/text_style.dart';

enum CategoryVariant { pills, tabs, tiles }

class CategoryPills extends StatelessWidget {
  final CategoryVariant variant;
  final List<String> categories;
  final int activeIndex;

  const CategoryPills({
    super.key,
    required this.variant,
    required this.categories,
    this.activeIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case CategoryVariant.pills:
        return SizedBox(
          height: 40.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, _) => SizedBox(width: 8.w),
            itemBuilder: (context, index) {
              final isActive = index == activeIndex;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isActive ? AppColor.accent : const Color(0xFFEDF2F7),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: isActive ? Colors.white : const Color(0xFF4A5568),
                    ),
                  ),
                ),
              );
            },
          ),
        );

      case CategoryVariant.tabs:
        return SizedBox(
          height: 55.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: categories.length,
            separatorBuilder: (_, _) => SizedBox(width: 24.w),
            itemBuilder: (context, index) {
              final isActive = index == activeIndex;
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
                    Container(
                      height: 3.h,
                      width: 30.w,
                      color: AppColor.primary,
                    ),
                ],
              );
            },
          ),
        );

      case CategoryVariant.tiles:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: AppTextStyle.font16boldgray.copyWith(
                      color: AppColor.textDark,
                    ),
                  ),
                  Text(
                    "View All",
                    style: AppTextStyle.font14regularGrey.copyWith(
                      color: AppColor.accent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: _categoryTile(Icons.headset, categories[0], true),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _categoryTile(
                      Icons.smartphone,
                      categories[1],
                      false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
    }
  }

  Widget _categoryTile(IconData icon, String label, bool active) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: active
            ? AppColor.accent.withOpacity(0.1)
            : AppColor.grey.withOpacity(0.1),
        border: Border.all(
          color: active
              ? AppColor.accent.withOpacity(0.3)
              : AppColor.grey.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: active
                  ? AppColor.accent.withOpacity(0.15)
                  : AppColor.grey.withOpacity(0.2),
            ),
            child: Icon(icon, color: active ? AppColor.accent : AppColor.grey),
          ),
          SizedBox(width: 12.w),
          Text(
            label,
            style: AppTextStyle.font14regularGrey.copyWith(
              color: AppColor.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
