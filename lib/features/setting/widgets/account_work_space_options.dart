import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_svg/svg.dart';

class AccountWorkSpaceOptions extends StatelessWidget {
  const AccountWorkSpaceOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightBlueGray,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: AppColor.borderGrey),
      ),
      child: Column(
        children: [
          InkWell(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, top: 20, right: 20),
              leading: Icon(
                Icons.person_outline,
                size: 24,
                color: AppColor.green,
              ),
              title: Text(
                "Account Settings",
                style: AppTextStyle.font16boldgray,
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
              onTap: () {
                context.pushNamed(Routes.editProfile);
              },
            ),
          ),
          Divider(indent: 100, endIndent: 100),
          ListTile(
            contentPadding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
            leading: SvgPicture.asset("assets/svgs/privacy.svg"),

            title: Text("Privacy Policy", style: AppTextStyle.font16boldgray),
            trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
            onTap: () {
              // Handle privacy policy tap
            },
          ),
        ],
      ),
    );
  }
}
