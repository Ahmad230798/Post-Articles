// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ADHeroImage extends StatelessWidget {
  final String? imageUrl;

  const ADHeroImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Container(
        height: 240.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(
            image: imageUrl != null
                ? NetworkImage(imageUrl!)
                : const AssetImage("assets/images/placeholder.png")
                      as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
