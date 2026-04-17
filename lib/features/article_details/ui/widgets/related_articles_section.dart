import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/features/article_details/cubit/article_details_cubit.dart';
import 'package:flutter_project/features/article_details/cubit/article_details_state.dart';
import 'package:flutter_project/features/home/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ADRelatedArticles extends StatelessWidget {
  const ADRelatedArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleDetailsCubit, ArticleDetailsState>(
      builder: (context, state) {
        if (state.related.isEmpty) return const SizedBox();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Related Articles",
                style: AppTextStyle.font16boldgray.copyWith(
                  color: AppColor.primary,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 12.h),
              // ignore: unnecessary_to_list_in_spreads
              ...state.related.map((a) => _relatedItem(context, a)).toList(),
            ],
          ),
        );
      },
    );
  }

  Widget _relatedItem(BuildContext context, ArticleModel a) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.articleDetailsScreen, arguments: a);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        child: Row(
          children: [
            Container(
              height: 60.h,
              width: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image:
                      (a.coverImage != null &&
                          a.coverImage!.isNotEmpty &&
                          a.coverImage!.startsWith("http"))
                      ? NetworkImage(a.coverImage!)
                      : const AssetImage("assets/images/myProfilePic.jpg")
                            as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                a.title!,
                style: AppTextStyle.font14regularGrey.copyWith(
                  color: AppColor.textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
