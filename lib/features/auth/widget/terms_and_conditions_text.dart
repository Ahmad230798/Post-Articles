import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text("Privacy Policy", style: AppTextStyle.font12meduimlightgray),
        horizentalspace(24),
        Text("Terms of Service", style: AppTextStyle.font12meduimlightgray),
        horizentalspace(24),
        Text("Contact Support", style: AppTextStyle.font12meduimlightgray),
      ],
    );
  }
}
