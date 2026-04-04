import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscussionHeader extends StatelessWidget {
  const DiscussionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quantifying Neural Plasticity in Accelerated Learning Models",
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A365D),
          ),
        ),
        SizedBox(height: 16.h),

        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                _avatar("assets/images/profile.png"),
                Positioned(
                  left: 22.w,
                  child: _avatar("assets/images/profile.png"),
                ),
              ],
            ),
            SizedBox(width: 50.w),
            Text(
              "12 Active Participants • 48 Comments",
              style: TextStyle(fontSize: 11.sp, color: Color(0xFF4A5568)),
            ),
          ],
        ),
      ],
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
