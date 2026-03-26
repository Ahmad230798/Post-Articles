import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class HomeArticleCard extends StatelessWidget {
  final String title;
  final String category;
  final String image;
  final String likes;
  final String shares;

  const HomeArticleCard({
    super.key,
    required this.title,
    required this.category,
    required this.image,
    required this.likes,
    required this.shares,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child: Image.asset(
              image,
              height: 150.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // CONTENT
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CATEGORY + BOOKMARK
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: AppTextStyle.font16regularbluewithopacity.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.accent,
                      ),
                    ),
                    Icon(
                      Icons.bookmark_border,
                      color: AppColor.grey,
                      size: 20.sp,
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                // TITLE
                Text(
                  title,
                  style: AppTextStyle.font16boldgray.copyWith(
                    color: AppColor.textDark,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 8.h),

                // LIKES + SHARES
                Row(
                  children: [
                    Icon(Icons.favorite, size: 16.sp, color: AppColor.accent),
                    SizedBox(width: 4.w),
                    Text(
                      likes,
                      style: AppTextStyle.font12regularWhite70.copyWith(
                        color: AppColor.textDark,
                        fontSize: 12.sp,
                      ),
                    ),

                    SizedBox(width: 16.w),

                    Icon(Icons.share, size: 16.sp, color: AppColor.accent),
                    SizedBox(width: 4.w),
                    Text(
                      shares,
                      style: AppTextStyle.font12regularWhite70.copyWith(
                        color: AppColor.textDark,
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
  }
}
