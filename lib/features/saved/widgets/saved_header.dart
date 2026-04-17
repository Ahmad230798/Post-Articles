import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedHeader extends StatelessWidget {
  final int articlesCount;
  const SavedHeader({super.key, required this.articlesCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saved Research',
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A365D),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '$articlesCount curated articles in your archive',
          style: TextStyle(fontSize: 13.sp, color: const Color(0xFF4A5568)),
        ),
      ],
    );
  }
}
