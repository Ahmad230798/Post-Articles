import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 12.h, top: 6.h),
      decoration: BoxDecoration(
        color: AppColor.backgroundLight,
        border: Border(top: BorderSide(color: AppColor.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(icon: Icons.home_filled, label: "Home", isActive: true),
          _navItem(icon: Icons.explore, label: "Explore"),
          _navItem(icon: Icons.bookmark, label: "Saved"),
          _navItem(icon: Icons.person, label: "Profile"),
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    bool isActive = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24.sp,
          color: isActive ? AppColor.primary : AppColor.grey,
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: isActive ? AppColor.primary : AppColor.grey,
          ),
        ),
      ],
    );
  }
}
