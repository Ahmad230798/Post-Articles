import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/app_font.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/widgets/app_text_button.dart';
import 'package:flutter_project/features/setting/widgets/account_work_space_options.dart';
import 'package:flutter_project/features/setting/widgets/information_and_help_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "ScholarLink",
          style: AppTextStyle.font20boldPrimary.copyWith(letterSpacing: -0.25),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
          horizentalspace(22),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage("assets/images/mobile_screen.jpg"),
                    ),
                  ),
                ),
                horizentalspace(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Julian Vance",
                      style: AppTextStyle.font20regularblack,
                    ),
                    Text(
                      "Senior Fellow, Quantum Humanities",
                      style: AppTextStyle.font14regulardarkblue.copyWith(
                        fontFamily: AppFont.publicSans,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalspace(48),
            Text(
              "ACCOUNT WORKSPACE",
              style: AppTextStyle.font12semiboldbluegray,
            ),
            verticalspace(16),
            AccountWorkSpaceOptions(),
            verticalspace(25),
            Text(
              "Information & Help",
              style: AppTextStyle.font12semiboldbluegray,
            ),
            verticalspace(16),
            InformationAndHelpOptions(),
            verticalspace(40),
            AppTextButton(
              widget: Icon(Icons.logout, size: 24, color: AppColor.red),
              buttonText: "Log Out",
              onPressed: () {},
              backgroundcolor: Colors.white,
              textStyle: AppTextStyle.font16semiboldred,
              borderColor: AppColor.red,
            ),
            verticalspace(56),
            Center(
              child: Column(
                children: [
                  Text(
                    "SCHOLARLINK V2.4.0 • ACADEMIC EDITION",
                    style: AppTextStyle.font10meduimWgray,
                  ),
                  Text(
                    "© 2024 Global Research Initiative",
                    style: AppTextStyle.font10regulargray,
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
