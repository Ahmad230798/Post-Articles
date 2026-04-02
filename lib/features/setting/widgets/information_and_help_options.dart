import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';

class InformationAndHelpOptions extends StatelessWidget {
  const InformationAndHelpOptions({
    super.key,
  });

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
          ListTile(
            contentPadding: EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
            ),
            leading: SvgPicture.asset("assets/svgs/terms_icon.svg"),
            title: Text(
              "Terms of Service",
              style: AppTextStyle.font16boldgray,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
            onTap: () {
              // Handle account settings tap
            },
          ),
          Divider(indent: 100, endIndent: 100),
          ListTile(
            contentPadding: EdgeInsets.only(
              left: 20,
              bottom: 20,
              right: 20,
            ),
            leading: Icon(
              Icons.support_agent,
              size: 24,
              color: AppColor.green,
            ),
            title: Text(
              "Contact Support",
              style: AppTextStyle.font16boldgray,
            ),
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
