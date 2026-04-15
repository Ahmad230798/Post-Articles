import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageEdite extends StatelessWidget {
  const ProfileImageEdite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(vertical: 32.h),
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  color: Colors.white.withOpacity(0.2),
                ),
                Positioned(
                  top: 5,
                  bottom: 5,
                  left: 5,
                  right: 5,
                  child: Container(
                    width: 128.w,
                    height: 128.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile_image.jpg"),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    height: 28.h,
                    width: 29.w,
                    decoration: BoxDecoration(
                      color: AppColor.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            verticalspace(32),
            Text("Profile Picture", style: AppTextStyle.font18semibolddarkblue),
            Text(
              "Recommended: Square JPG or PNG, at least\n400x400px.",
              textAlign: TextAlign.center,
              style: AppTextStyle.font12regulergray.copyWith(
                color: AppColor.darkGray,
              ),
            ),
            verticalspace(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextButton(
                      buttonText: "Upload New",
                      textStyle: AppTextStyle.font14meduimbluegray.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  horizentalspace(12),
                  Expanded(
                    child: AppTextButton(
                      buttonText: "Remove",
                      backgroundcolor: Colors.white,
                      textStyle: AppTextStyle.font14meduimbluegray.copyWith(
                        color: AppColor.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
