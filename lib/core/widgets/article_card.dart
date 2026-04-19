import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/home/models/article_model.dart';

class ArticleCard extends StatefulWidget {
  final ArticleModel article;
  final void Function()? onTap;
  const ArticleCard({super.key, required this.article, this.onTap});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard>
    with SingleTickerProviderStateMixin {
  late int likeCount;
  late bool isLiked;
  late bool isBookmarked;

  late AnimationController _animController;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    likeCount = widget.article.likesCount ?? 0;
    isLiked = widget.article.isLiked ?? false; // 🔵 بدل false
    isBookmarked = widget.article.isSaved ?? false; // 🔵 بدل false

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.8,
      upperBound: 1.0,
    );

    _scaleAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> toggleLike() async {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });

    _animController.forward().then((_) => _animController.reverse());

    await ApiServices().postData(url: "/articles/${widget.article.slug}/like/");
  }

  Future<void> toggleBookmark() async {
    setState(() {
      isBookmarked = !isBookmarked;
    });

    _animController.forward().then((_) => _animController.reverse());

    await ApiServices().postData(
      url: "/articles/${widget.article.slug}/bookmark/",
    );
  }

  @override
  Widget build(BuildContext context) {
    final article = widget.article;

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
          color: AppColor.veryLightGray,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColor.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AUTHOR → PROFILE PAGE
            Stack(
              children: [
                Column(
                  children: [
                    // IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child:
                          (article.coverImage != null &&
                              article.coverImage!.isNotEmpty)
                          ? Image.network(
                              article.coverImage!,
                              height: 250.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 160.h,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                              child: const Icon(Icons.image, size: 40),
                            ),
                    ),
                  ],
                ),
                Positioned(
                  child: Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: AppColor.border.withOpacity(0.5),
                    ),
                    child: Row(
                      children: [
                        if (article.authorName != null) Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/userProfileScreen",
                                arguments: article.authorName,
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  article.authorName!,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                CircleAvatar(
                                  radius: 18.r,
                                  backgroundColor: Colors.grey.shade300,
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.accent,
                        ),
                      ),

                      // BOOKMARK BUTTON
                      GestureDetector(
                        onTap: toggleBookmark,
                        child: ScaleTransition(
                          scale: _scaleAnim,
                          child: Icon(
                            isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: isBookmarked
                                ? AppColor.accent
                                : AppColor.grey,
                            size: 26.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  // TITLE
                  Text(
                    article.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17.sp,
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
                        fontSize: 14.sp,
                        color: const Color(0xFF4A5568),
                      ),
                    ),

                  SizedBox(height: 10.h),

                  // LIKES + COMMENTS
                  Row(
                    children: [
                      // LIKE BUTTON
                      GestureDetector(
                        onTap: toggleLike,
                        child: ScaleTransition(
                          scale: _scaleAnim,
                          child: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            size: 24.sp,
                            color: isLiked ? Colors.red : AppColor.accent,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        "$likeCount",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColor.textDark,
                        ),
                      ),

                      SizedBox(width: 20.w),

                      // COMMENTS BUTTON
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/commentsScreen",
                            arguments: article.slug,
                          );
                        },
                        child: Icon(
                          Icons.chat_bubble_outline,
                          size: 24.sp,
                          color: AppColor.accent,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        "${article.commentsCount ?? 0}",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColor.textDark,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 14.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
