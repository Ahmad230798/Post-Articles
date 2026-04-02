// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  final String avatar;
  final String name;
  final String role;
  final String time;
  final String text;
  final String likes;

  const CommentCard({
    super.key,
    required this.avatar,
    required this.name,
    required this.role,
    required this.time,
    required this.text,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _avatar(avatar),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A365D),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "$role • $time",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Color(0xFF4A5568),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              size: 18.sp,
                              color: Color(0xFF319795),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              likes,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xFF319795),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 24.w),
                        Row(
                          children: [
                            Icon(
                              Icons.reply,
                              size: 18.sp,
                              color: Color(0xFF319795),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "Reply",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xFF319795),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _avatar(String url) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
      ),
    );
  }
}
