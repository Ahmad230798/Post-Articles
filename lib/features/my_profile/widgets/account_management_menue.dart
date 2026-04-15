import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';

class AccountManagementMenue extends StatelessWidget {
  const AccountManagementMenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountManagementMenueElement(
            icon: Icon(Icons.settings, color: AppColor.darkGray),
            element: "Profile Settings",
          ),
          verticalspace(18),
          AccountManagementMenueElement(
            element: "Saved Articles",
            icon: Icon(Icons.bookmark_border, color: AppColor.darkGray),
          ),
          verticalspace(18),
          AccountManagementMenueElement(
            icon: Icon(Icons.privacy_tip_outlined, color: AppColor.darkGray),
            element: "Security And Privacy",
          ),
        ],
      ),
    );
  }
}

class AccountManagementMenueElement extends StatelessWidget {
  final Widget icon;
  final String element;
  const AccountManagementMenueElement({
    super.key,
    required this.icon,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        horizentalspace(12),
        Text(element, style: AppTextStyle.font14meduimbluegray),
      ],
    );
  }
}
