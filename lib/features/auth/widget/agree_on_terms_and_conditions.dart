import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class AgreeOnTermsAndConditions extends StatefulWidget {
  const AgreeOnTermsAndConditions({super.key});

  @override
  State<AgreeOnTermsAndConditions> createState() =>
      _AgreeOnTermsAndConditionsState();
}

class _AgreeOnTermsAndConditionsState extends State<AgreeOnTermsAndConditions> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isClicked,
          onChanged: (value) {
            setState(() {
              isClicked = value!;
            });
          },
        ),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: "I agree to the ",
                style: AppTextStyle.font12regulardarkblue,
              ),
              TextSpan(
                text: "Terms of Service",
                style: AppTextStyle.font12regulargreen,
              ),
              TextSpan(text: " and", style: AppTextStyle.font12regulardarkblue),
              TextSpan(
                text: " Privecy\nPolicy",
                style: AppTextStyle.font12regulargreen,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
