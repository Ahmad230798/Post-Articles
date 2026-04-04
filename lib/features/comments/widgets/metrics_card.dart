// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetricsCard extends StatelessWidget {
  const MetricsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Color(0xFFE6FFFA),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xFF319795).withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Citation Momentum",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C7A7B),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "This discussion has sparked 3 new citations today.",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Color(0xFF2C7A7B).withOpacity(0.8),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Color(0xFF319795),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              "+14%",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
