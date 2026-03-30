import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  const ProfileCard({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.borderGrey, width: 1),
      ),
      child: Card(
        elevation: 0,
        shadowColor: AppColor.shadow,
        color: Colors.white,
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.textLight,
            ),

            child: Icon(icon, color: AppColor.border),
          ),
          title: Text(title, style: AppTextStyle.font14bolddarkblue),
          subtitle: Text(description, style: AppTextStyle.font12regulergray),
        ),
      ),
    );
  }
}
