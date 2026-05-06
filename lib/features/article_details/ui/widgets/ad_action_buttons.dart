// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/article_details/cubit/article_details_cubit.dart';
import 'package:flutter_project/features/home/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class ADActionsButtons extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback onBookmark;
  final VoidCallback onCite;
  final VoidCallback onLike;
  final ArticleModel article;

  const ADActionsButtons({
    super.key,
    required this.isBookmarked,
    required this.onBookmark,
    required this.onCite,
    required this.onLike,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          _actionButton(Icons.picture_as_pdf, "Rate", () {
            final cubit = context.read<ArticleDetailsCubit>();
            showDialog(
              context: context,
              builder: (context) {
                int selectedRating = 0;
                return StatefulBuilder(
                  builder: (context, setDialogState) {
                    return AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: selectedRating == 0
                              ? null
                              : () {
                                  cubit.addRate(article.slug!, selectedRating);
                                  Navigator.pop(context);
                                },
                          child: const Text("Submit"),
                        ),
                      ],
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("How would you rate this article?"),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              final starNumber = index + 1;
                              return IconButton(
                                onPressed: () {
                                  setDialogState(() {
                                    selectedRating = starNumber;
                                  });
                                },
                                icon: Icon(
                                  starNumber <= selectedRating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: AppColor.green,
                                  size: 32,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColor.accent,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 22.sp),
              SizedBox(height: 6.h),
              Text(
                label,
                style: AppTextStyle.font12regularWhite70.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
