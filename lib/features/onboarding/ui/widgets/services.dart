import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Container(
            width: 1.sw,

            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/upload.svg"),
                  SizedBox(height: 12.h),
                  Text("One-Tap", style: AppTextStyle.font16boldlightblue),
                  SizedBox(height: 4.h),
                  Text(
                    "Instant distribution",
                    style: AppTextStyle.font12regulergray,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: 1.sw,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/async.svg"),
                  SizedBox(height: 12.h),
                  Text("Auto-sync", style: AppTextStyle.font16boldlightblue),
                  SizedBox(height: 4.h),
                  Text(
                    "Updates everywhere",
                    style: AppTextStyle.font12regulergray,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: 1.sw,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/real_time.svg"),
                  SizedBox(height: 12.h),
                  Text("Instant", style: AppTextStyle.font16boldlightblue),
                  SizedBox(height: 4.h),
                  Text(
                    "Real-time delivery",
                    style: AppTextStyle.font12regulergray,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
