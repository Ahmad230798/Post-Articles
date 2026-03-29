import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/routing/routes.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: AppTextStyle.font14regulardarkblue,
          ),
          TextSpan(
            text: "Sign up for free",
            style: AppTextStyle.font14bolddarkblue,
            recognizer: TapGestureRecognizer()..onTap = () {
              context.pushNamed(Routes.signUpScreen);
            },
          ),
        ],
      ),
    );
  }
}
