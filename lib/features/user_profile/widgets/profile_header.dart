import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final String? imagePath;
  final bool isLoading;
  final String userName;
  final String userTitle;
  final String userLocation;
  final String bottomText;

  final void Function()? onPressed;
  const ProfileHeader({
    super.key,
    this.imagePath,
    required this.userName,
    required this.userTitle,
    required this.userLocation,
    this.onPressed,
    required this.isLoading, required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.avatarShadow,
                      offset: Offset(0, 20),
                      blurRadius: 25,
                      spreadRadius: -5,
                    ),
                    BoxShadow(
                      offset: Offset(0, 8),
                      color: AppColor.avatarShadow,
                      blurRadius: 10,
                      spreadRadius: -6,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundImage: AssetImage(
                    imagePath ?? "assets/images/profile_image.jpg",
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColor.green,
                    radius: 15.r,
                    child: Icon(
                      Icons.verified_outlined,
                      size: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalspace(16),
        Text(userName, style: AppTextStyle.font24bolddark),
        Text(userTitle, style: AppTextStyle.font16regularlightgray),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined, size: 16, color: AppColor.grey),
            horizentalspace(4),
            Text(userLocation, style: AppTextStyle.font14regularGrey),
          ],
        ),
        verticalspace(24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: AppTextButton(
                  isLoading: isLoading,
                  buttonText: bottomText,
                  onPressed: onPressed,
                ),
              ),
              horizentalspace(12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mail_outline, size: 24),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
