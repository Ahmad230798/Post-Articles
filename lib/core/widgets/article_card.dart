import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_color.dart';

class ArticleCard extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String? readTime;
  final String? description;
  final String? likes;
  final String? shares;
  final String? authorAvatar;
  final String? authorName;
  final bool isSaved;

  const ArticleCard({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    this.readTime,
    this.description,
    this.likes,
    this.shares,
    this.authorAvatar,
    this.authorName,
    this.isSaved = false,
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.accent,
                      ),
                    ),
                    Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: AppColor.grey,
                      size: 20.sp,
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                // TITLE
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textDark,
                  ),
                ),

                if (readTime != null || description != null) ...[
                  SizedBox(height: 8.h),
                  if (readTime != null)
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 14,
                          color: Color(0xFF4A5568),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          readTime!,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: const Color(0xFF4A5568),
                          ),
                        ),
                      ],
                    ),
                  if (description != null)
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: const Color(0xFF4A5568),
                        ),
                      ),
                    ),
                ],

                if (likes != null || shares != null) ...[
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      if (likes != null) ...[
                        Icon(
                          Icons.favorite,
                          size: 16.sp,
                          color: AppColor.accent,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          likes!,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.textDark,
                          ),
                        ),
                      ],
                      if (shares != null) ...[
                        SizedBox(width: 16.w),
                        Icon(Icons.share, size: 16.sp, color: AppColor.accent),
                        SizedBox(width: 4.w),
                        Text(
                          shares!,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.textDark,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],

                if (authorAvatar != null && authorName != null) ...[
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundImage: AssetImage(authorAvatar!),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        authorName!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D3748),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
