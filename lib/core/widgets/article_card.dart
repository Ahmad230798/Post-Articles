import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/features/home/models/article_model.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/articleDetailsScreen",
          arguments: article,
        );
      },
      child: Container(
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
              child:
                  (article.coverImage != null && article.coverImage!.isNotEmpty)
                  ? Image.network(
                      article.coverImage!,
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 150.h,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image, size: 40),
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
                        article.categoryName ?? "Unknown",
                        style: TextStyle(
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
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textDark,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // DESCRIPTION
                  if (article.description != null)
                    Text(
                      article.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF4A5568),
                      ),
                    ),

                  SizedBox(height: 8.h),

                  // LIKES + COMMENTS
                  Row(
                    children: [
                      Icon(Icons.favorite, size: 16.sp, color: AppColor.accent),
                      SizedBox(width: 4.w),
                      Text(
                        "${article.likesCount ?? 0}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColor.textDark,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Icon(
                        Icons.chat_bubble,
                        size: 16.sp,
                        color: AppColor.accent,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${article.commentsCount ?? 0}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColor.textDark,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  // AUTHOR
                  if (article.authorName != null)
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16.r,
                          backgroundColor: Colors.grey.shade300,
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          article.authorName!,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
