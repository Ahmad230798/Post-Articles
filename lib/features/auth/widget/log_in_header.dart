import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColor.primary,
            size: 25,
          ),
          onPressed: () {},
        ),
        horizentalspace(90),
        Text("ScholarLink", style: AppTextStyle.font18boldlightblue),
      ],
    );
  }
}
