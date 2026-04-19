import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/features/saved/logic/cubit/saved_articals_cubit.dart';

class AccountManagementMenue extends StatelessWidget {
  const AccountManagementMenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              context.pushNamed(Routes.editProfile);
            },
            child: AccountManagementMenueElement(
              icon: Icon(Icons.settings, color: AppColor.darkGray),
              element: "Profile Settings",
            ),
          ),
          verticalspace(18),
          InkWell(
            onTap: () {
              context.read<SavedArticalsCubit>().getSavedArticals();
              context.pushNamed(Routes.savedScreen);
            },
            child: AccountManagementMenueElement(
              element: "Saved Articles",
              icon: Icon(Icons.bookmark_border, color: AppColor.darkGray),
            ),
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
