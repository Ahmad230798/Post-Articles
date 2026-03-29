import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_project/features/auth/widget/agree_on_terms_and_conditions.dart';
import 'package:flutter_project/features/auth/widget/already_have_an_account_text.dart';
import 'package:flutter_project/features/auth/widget/app_text_button.dart';
import 'package:flutter_project/features/auth/widget/drop_down_menue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
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
                    Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "First Name",
                            style: AppTextStyle.font14meduimbluegray,
                          ),
                          verticalspace(4),
                          AppTextFormField(hinttText: "Isaac"),
                          verticalspace(16),
                          Text(
                            "Last Name",
                            style: AppTextStyle.font14meduimbluegray,
                          ),
                          verticalspace(4),
                          AppTextFormField(hinttText: "Newton"),
                          verticalspace(16),
                          Text(
                            "Institutional Email",
                            style: AppTextStyle.font14meduimbluegray,
                          ),

                          verticalspace(4),
                          AppTextFormField(
                            hinttText: "isaac.newton@cambridge.edu",
                          ),
                          verticalspace(16),
                          Text(
                            "Field of Study",
                            style: AppTextStyle.font14meduimbluegray,
                          ),

                          verticalspace(4),
                          DropDownMenue(),
                          verticalspace(16),
                          Text(
                            "Academic Status",
                            style: AppTextStyle.font14meduimbluegray,
                          ),

                          verticalspace(4),
                          DropDownMenue(),
                          verticalspace(16),
                          Text(
                            "Institution",
                            style: AppTextStyle.font14meduimbluegray,
                          ),

                          verticalspace(4),
                          AppTextFormField(
                            hinttText: "University of Cambridge",
                          ),
                          verticalspace(16),
                          Text(
                            "Password",
                            style: AppTextStyle.font14meduimbluegray,
                          ),

                          verticalspace(4),
                          AppTextFormField(hinttText: "••••••••"),
                          verticalspace(20),
                          AgreeOnTermsAndConditions(),
                          verticalspace(21),
                          AppTextButton(
                            buttonText: "Create My Account",
                            horizontalPadaing: 80,
                          ),
                          verticalspace(65),
                          Center(
                            child: AlreadyHaveAnAccountText(
                              firstText: 'Already have an account? ',
                              secondText: 'Sign In',
                            ),
                          ),
                        ],
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
