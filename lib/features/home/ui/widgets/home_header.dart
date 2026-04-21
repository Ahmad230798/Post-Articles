import 'package:flutter/material.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🔹 زر فتح السايد مينيو
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu, size: 28.sp, color: AppColor.primary),
          ),

          Text("InsightHub", style: AppTextStyle.font20boldPrimary),

          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.myProfileScreen,
                  );
                },
                child: Icon(Icons.search, size: 24.sp, color: AppColor.primary),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.myProfileScreen);
                },
                child: CircleAvatar(
                  radius: 16.r,
                  backgroundImage: const AssetImage(
                    "assets/images/profile.png",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
