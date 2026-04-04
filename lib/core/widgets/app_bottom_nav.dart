import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_color.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.home_filled, "Home"),
      (Icons.explore, "Explore"),
      (Icons.bookmark, "Saved"),
      (Icons.person, "Profile"),
    ];

    return Container(
      padding: EdgeInsets.only(bottom: 12.h, top: 6.h),
      decoration: BoxDecoration(
        color: AppColor.backgroundLight,
        border: Border(top: BorderSide(color: AppColor.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final (icon, label) = items[index];
          final isActive = index == currentIndex;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
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
            ),
          );
        }),
      ),
    );
  }
}
