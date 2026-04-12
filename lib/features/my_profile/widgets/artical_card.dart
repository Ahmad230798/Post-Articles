import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/app_font.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticalCard extends StatelessWidget {
  final String kindAndDate;
  final String title;
  final String text;
  const ArticalCard({
    super.key,
    required this.kindAndDate,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(vertical: 28, horizontal: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: AppColor.borderGrey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(kindAndDate, style: AppTextStyle.font10boldgray),
          verticalspace(11),
          Text(
            title,
            style: AppTextStyle.font20boldPrimary.copyWith(
              fontFamily: AppFont.newsreader,
            ),
          ),
          verticalspace(12),
          Text(
            text,
            style: AppTextStyle.font14regulardarkblue.copyWith(
              fontFamily: AppFont.publicSans,
            ),
          ),
          verticalspace(11),
          Row(
            children: [
              Spacer(),
              Icon(Icons.mode_comment_outlined, size: 15),
              Text("12"),
              horizentalspace(16),
              Icon(Icons.bookmark_border, size: 15),
              Text("84"),
            ],
          ),
        ],
      ),
    );
  }
}
