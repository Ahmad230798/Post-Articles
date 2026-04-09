import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/core/widgets/app_text_button.dart';
import 'package:flutter_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_project/features/auth/data/model/login_model/login_request_body.dart';
import 'package:flutter_project/features/auth/logic/cubit/login_cubit.dart';
import 'package:flutter_project/features/auth/widget/already_have_an_account_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,
    required this.formKey,
    required this.cubit,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final LoginCubit cubit;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColor.borderGrey,
              width: 1.sp,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 35.h,
              horizontal: 32.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/loginavatar.svg",
                      ),
                      verticalspace(28),
                      Text(
                        "Welcome Back",
                        style: AppTextStyle.font30boldblack,
                      ),
                      verticalspace(8),
                      Text(
                        "Sign in to continue your learning\njourney",
                        textAlign: TextAlign.center,
                        style: AppTextStyle
                            .font16regularbluewithopacity
                            .copyWith(
                              color: AppColor.lightgrey,
                              height: 24 / 16,
                              letterSpacing: 0,
                            ),
                      ),
                    ],
                  ),
                ),
                verticalspace(32),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email Address",
                        style:
                            AppTextStyle.font14semiboldbluegray,
                      ),
                      verticalspace(8),
                      AppTextFormField(
                        controller: cubit.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
    
                          final emailRegex = RegExp(
                            r'^[^@]+@[^@]+\.[^@]+',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return "Enter a valid email";
                          }
    
                          return null;
                        },
                        hinttText: "name@university.edu",
                      ),
                      verticalspace(20),
                      Row(
                        children: [
                          Text(
                            "Password",
                            style: AppTextStyle
                                .font14semiboldbluegray,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              // Go to forget password screen
                            },
                            child: Text(
                              "Forget Passowrd?",
                              style: AppTextStyle
                                  .font14regularGrey
                                  .copyWith(
                                    color: AppColor.green,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      verticalspace(8),
                      AppTextFormField(
                        controller: cubit.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                        hinttText: "Enter your password",
                        suffixIcone: IconButton(
                          onPressed: () {
                            context
                                .read<LoginCubit>()
                                .togglePasswordVisibility();
                          },
                          icon: Icon(
                            cubit.isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 25,
                            color: AppColor.lightgrey,
                          ),
                        ),
                        isObscureText: cubit.isObscure,
                      ),
                      verticalspace(20),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: cubit.rememberMe,
                            onChanged: (value) {
                              cubit.toggleRememberMe(value!);
                            },
                          ),
                          const Text("Remember me for 30 days"),
                        ],
                      ),
                      verticalspace(20),
                      AppTextButton(
                        buttonText: 'Sign In',
                        onPressed: isLoading
                            ? null
                            : () {
                                if (formKey.currentState!
                                    .validate()) {
                                  cubit.login(
                                    LoginRequestBody(
                                      email: context
                                          .read<LoginCubit>()
                                          .emailController
                                          .text,
                                      password: context
                                          .read<LoginCubit>()
                                          .passwordController
                                          .text,
                                    ),
                                  );
                                }
                              },
                        isLoading: isLoading,
                      ),
                      verticalspace(20),
                      AlreadyHaveAnAccountText(
                        firstText: "Don't have an account?",
                        secondText: 'Sign up for free',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(
                              Routes.signUpScreen,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
