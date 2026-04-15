import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/features/article_details/cubit/article_details_cubit.dart';
import 'package:flutter_project/features/article_details/cubit/article_details_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              Text(
                "Comments (${state.comments.length})",
                style: AppTextStyle.font16boldgray.copyWith(
                  color: AppColor.primary,
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 12.h),

              /// 🔵 List of comments
              // ignore: unnecessary_to_list_in_spreads
              ...state.comments.map((c) => _commentItem(c)).toList(),

              SizedBox(height: 16.h),

              /// 🔵 Add Comment
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

  Widget _commentItem(dynamic c) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColor.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            c["author"]?["username"] ?? "User",
            style: AppTextStyle.font14regularGrey.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColor.primary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            c["content"] ?? "",
            style: AppTextStyle.font14regularGrey.copyWith(
              color: AppColor.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
