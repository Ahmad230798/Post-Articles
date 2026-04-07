import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/widgets/app_top_nav_bar.dart';
import 'package:flutter_project/features/user_profile/widgets/areas_and_expertise.dart';
import 'package:flutter_project/features/user_profile/widgets/profile_header.dart';
import 'package:flutter_project/features/user_profile/widgets/user_bio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileHeader(
                      userName: 'Marcus Chen',
                      userTitle: 'Principal Cloud Architect',
                      userLocation: 'Seattle, WA',
                    ),
                    verticalspace(40),
                    UserBio(followers: '4.8k', posts: '124', impact: '92'),
                    verticalspace(32),
                    Text(
                      "Areas of Expertise",
                      style: AppTextStyle.font18boldlightblue,
                    ),
                    verticalspace(16),
                    AreasAndExpertise(),
                    verticalspace(8),
                    Text("About", style: AppTextStyle.font18boldlightblue),
                    verticalspace(8),
                    Text(
                      "Passionate about building scalable distributed\nsystems and mentoring the next generation of\nengineers. 15+ years of experience leading cross-\nfunctional teams at Fortune 500 companies.\nFrequent speaker at KubeCon and AWS re:Invent.",
                      style: AppTextStyle.font14regulardarkblue.copyWith(
                        color: AppColor.darkBlueGray,
                      ),
                    ),
                    verticalspace(15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
