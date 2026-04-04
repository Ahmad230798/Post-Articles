// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentInputBar extends StatelessWidget {
  const CommentInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
        bottom: 24.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            _avatar(),
            SizedBox(width: 12.w),
            Expanded(
              child: Container(
                height: 48.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Color(0xFFEDF2F7),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    "Share your scholarly perspective...",
                    style: TextStyle(color: Color(0xFF4A5568), fontSize: 14.sp),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: Color(0xFF319795),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: const Icon(Icons.send, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar() {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/profile.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
