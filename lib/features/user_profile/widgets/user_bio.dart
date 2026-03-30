import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';

class UserBio extends StatelessWidget {
  final String followers;
  final String posts;
  final String impact;
  const UserBio({super.key, required this.followers, required this.posts, required this.impact});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(followers, style: AppTextStyle.font24boldgreen),
              Row(
                children: [
                  Icon(Icons.groups, size: 20, color: AppColor.green),
                  horizentalspace(5),
                  Text("NETWORK", style: AppTextStyle.font12meduimlightgray),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(posts, style: AppTextStyle.font24boldgreen),
              Row(
                children: [
                  Icon(Icons.article_outlined, size: 20, color: AppColor.green),
                  horizentalspace(5),
                  Text("POSTES", style: AppTextStyle.font12meduimlightgray),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(impact, style: AppTextStyle.font24boldgreen),
              Row(
                children: [
                  Icon(Icons.bolt_outlined, size: 20, color: AppColor.green),
                  horizentalspace(5),
                  Text("IMPACT", style: AppTextStyle.font12meduimlightgray),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
