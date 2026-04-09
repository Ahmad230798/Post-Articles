import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_svg/svg.dart';

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
            icon: Icon(Icons.settings),
            element: "Profile Settings",
          ),
          verticalspace(18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AccountManagementMenueElement(
              icon: SvgPicture.asset("assets/svgs/Save20.svg"),
              element: "Saved Articles",
            ),
          ),
          verticalspace(18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: AccountManagementMenueElement(
              icon: Icon(Icons.privacy_tip_outlined),
              element: "Security And Privacy",
            ),
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
      children: [
        icon,
        horizentalspace(12),
        Text(element, style: AppTextStyle.font14meduimbluegray),
      ],
    );
  }
}
