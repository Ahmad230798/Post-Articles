import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/features/article_details/cubit/article_details_cubit.dart';
import 'package:flutter_project/features/article_details/cubit/article_details_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class ADCommentsSection extends StatelessWidget {
  final String slug;

  const ADCommentsSection({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleDetailsCubit, ArticleDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ArticleDetailsCubit>();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔵 Title
              Text(
                "Comments (${state.comments.length})",
                style: AppTextStyle.font16boldgray.copyWith(
                  color: AppColor.primary,
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 12.h),

              /// 🔵 Comments List
              // ignore: unnecessary_to_list_in_spreads
              ...state.comments.map((c) => _commentItem(c)).toList(),

              SizedBox(height: 16.h),

              /// 🔵 Add Comment Input
              TextField(
                controller: cubit.commentController,
                decoration: InputDecoration(
                  hintText: "Write a comment...",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppColor.grey),
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    cubit.addComment(slug, cubit.commentController.text);
                    cubit.commentController.clear();
                  },
                  child: const Text("Post"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// ⭐ Comment Item UI
  Widget _commentItem(dynamic c) {
    final username = c["author"]?["username"] ?? "User";
    final content = c["content"] ?? "";
    final createdAt = c["created_at"];

    String timeAgo = "";
    if (createdAt != null && createdAt.toString().isNotEmpty) {
      try {
        final date = DateTime.parse(createdAt);
        timeAgo = timeago.format(date, locale: "en_short");
      } catch (_) {}
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColor.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔵 Avatar
          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColor.primary.withOpacity(0.2),
            child: Text(
              username.isNotEmpty ? username[0].toUpperCase() : "?",
              style: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(width: 12.w),

          /// 🔵 Comment Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Username + Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      username,
                      style: AppTextStyle.font14regularGrey.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: AppTextStyle.font12regularGrey.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                /// Comment Text
                Text(
                  content,
                  style: AppTextStyle.font14regularGrey.copyWith(
                    color: AppColor.textDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
