import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';

import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/routing/routes.dart';

import 'package:flutter_project/features/auth/logic/cubit/signup_cubit.dart';
import 'package:flutter_project/features/auth/widget/already_have_an_account_text.dart';

import 'package:flutter_project/features/auth/widget/sign_up_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 46.h),
            child: Container(
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadow,
                    blurRadius: 50,
                    spreadRadius: -12,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Academic Profile",
                      style: AppTextStyle.font24bolddark,
                    ),
                    verticalspace(4),
                    Text(
                      "Fill in the details below to begin your\njourney.",
                      style: AppTextStyle.font16regularlightgray,
                    ),
                    verticalspace(32),
                    SignUpForm(formKey: formKey, cubit: cubit),
                    verticalspace(65),
                    Center(
                      child: AlreadyHaveAnAccountText(
                        firstText: 'Already have an account? ',
                        secondText: 'Sign In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(Routes.loginScreen);
                          },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
