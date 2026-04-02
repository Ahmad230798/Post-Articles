import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReplyCard extends StatelessWidget {
  final String avatar;
  final String name;
  final String role;
  final String time;
  final String text;
  final String likes;

  const ReplyCard({
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
      margin: EdgeInsets.only(left: 56.w, top: 24.h),
      padding: EdgeInsets.only(left: 24.w),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Color(0xFFE2E8F0), width: 2)),
      ),
      child: Row(
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
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A365D),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "$role • $time",
                  style: TextStyle(fontSize: 10.sp, color: Color(0xFF4A5568)),
                ),
                SizedBox(height: 8.h),
                Text(
                  text,
                  style: TextStyle(fontSize: 13.sp, color: Color(0xFF2D3748)),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          size: 14.sp,
                          color: Color(0xFF319795),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          likes,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFF319795),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      "Reply",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF319795),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatar(String url) {
    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
      ),
    );
  }
}
