import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/routing/routes.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  final String firstText;
  final String secondText;
 final GestureRecognizer recognizer;
  const AlreadyHaveAnAccountText({
    super.key,
    required this.firstText,
    required this.secondText, required this.recognizer,
    
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: firstText, style: AppTextStyle.font14regulardarkblue),
          TextSpan(
            text: secondText,
            style: AppTextStyle.font14bolddarkblue,
            recognizer: recognizer
          ),
        ],
      ),
    );
  }
}
