// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTopNavBar extends StatelessWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;
  final Widget? trailing;
  final bool centerTitle; // ← إضافة جديدة

  const AppTopNavBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.actions,
    this.trailing,
    this.centerTitle = false, // ← القيمة الافتراضية
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 64.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // LEFT SIDE
            if (showBack)
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                color: const Color(0xFF1A365D),
              )
            else
              SizedBox(width: 48.w), // حتى يضل التايتل بالنص
            // CENTER TITLE
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A365D),
                  ),
                ),
              ),
            ),

            // RIGHT SIDE
            trailing ??
                Row(mainAxisSize: MainAxisSize.min, children: actions ?? []),
          ],
        ),
      ),
    );
  }
}
