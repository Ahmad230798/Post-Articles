import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_project/features/auth/data/model/login_model/login_request_body.dart';
import 'package:flutter_project/features/auth/logic/cubit/login_cubit.dart';
import 'package:flutter_project/features/auth/logic/cubit/login_state.dart';
import 'package:flutter_project/features/auth/widget/already_have_an_account_text.dart';
import 'package:flutter_project/core/widgets/app_text_button.dart';
import 'package:flutter_project/features/auth/widget/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool isClicked = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login successful')));

          context.pushAndRemoveUntil(
            Routes.homeScreen,
            predicate: (Route<dynamic> route) => false,
          );
        }

        if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
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
                        Text(
                          "ScholarLink",
                          style: AppTextStyle.font18boldlightblue,
                        ),
                      ],
                    ),
                    verticalspace(40),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email Address",
                                    style: AppTextStyle.font14semiboldbluegray,
                                  ),
                                  verticalspace(8),
                                  AppTextFormField(
                                    controller: emailController,
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
                                        style:
                                            AppTextStyle.font14semiboldbluegray,
                                      ),
                                      Expanded(child: SizedBox()),
                                      GestureDetector(
                                        child: Text(
                                          "Forget Passowrd?",
                                          style: AppTextStyle.font14regularGrey
                                              .copyWith(
                                                color: AppColor.green,
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        onTap: () {
                                          //Go to forget passowrd screen
                                        },
                                      ),
                                    ],
                                  ),
                                  verticalspace(8),
                                  AppTextFormField(
                                    controller: passwordController,
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
                                        setState(() {
                                          isObscureText = !isObscureText;
                                        });
                                      },
                                      icon: Icon(
                                        isObscureText
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        size: 25,
                                        color: AppColor.lightgrey,
                                      ),
                                    ),
                                    isObscureText: isObscureText,
                                  ),
                                  verticalspace(20),

                                  Row(
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
                                      Text("Remember me for 30 days"),
                                    ],
                                  ),
                                  verticalspace(20),
                                  AppTextButton(
                                    buttonText: 'Sign In',
                                    onPressed: isLoading ? null : _login,
                                    isLoading: isLoading,
                                  ),
                                  verticalspace(20),
                                  AlreadyHaveAnAccountText(
                                    firstText: "Don't have an account?",
                                    secondText: 'Sign up for free',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushNamed(Routes.signUpScreen);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalspace(32),
                    TermsAndConditionsText(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
