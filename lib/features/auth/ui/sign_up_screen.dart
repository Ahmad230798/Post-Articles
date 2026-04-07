import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/helpers/snack_bar_helper.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_request_body.dart';
import 'package:flutter_project/features/auth/logic/cubit/signup_cubit.dart';
import 'package:flutter_project/features/auth/logic/cubit/signup_state.dart';
import 'package:flutter_project/features/auth/widget/agree_on_terms_and_conditions.dart';
import 'package:flutter_project/features/auth/widget/already_have_an_account_text.dart';
import 'package:flutter_project/core/widgets/app_text_button.dart';
import 'package:flutter_project/features/auth/widget/drop_down_menue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedAcademicStatus = 'graduate';
  final formKey = GlobalKey<FormState>();

  late TextEditingController userNameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController institutionController;
  late TextEditingController passwordController;
  late TextEditingController verifyPasswordController;
  late TextEditingController fieldOfStudy;
  late TextEditingController accademicStatus;

  @override
  void initState() {
    super.initState();

    userNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    institutionController = TextEditingController();
    passwordController = TextEditingController();
    verifyPasswordController = TextEditingController();
    fieldOfStudy = TextEditingController();
    accademicStatus = TextEditingController();
  }

  @override
  void dispose() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    institutionController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
    fieldOfStudy.dispose();
    accademicStatus.dispose();
    super.dispose();
  }

  void _register() {
    if (formKey.currentState!.validate()) {
      context.read<SignupCubit>().signUp(
        RegisterRequestBody(
          username: userNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          password2: verifyPasswordController.text.trim(),
          fieldOfStudy: fieldOfStudy.text.trim(),
          academicStatus: selectedAcademicStatus,
          institution: institutionController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastNmae: lastNameController.text.trim(),
        ),
      );
    }
  }

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
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            style: AppTextStyle.font14meduimbluegray,
                          ),
                          verticalspace(4),
                          AppTextFormField(
                            hinttText: "Isaac",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Username is required";
                              }
                              if (value.length < 3) {
                                return "Username must be at least 3 characters";
                              }
                              return null;
                            },
                            controller: userNameController,
                          ),
                          Text(
                            "First Name",
                            style: AppTextStyle.font14meduimbluegray,
                          ),
                          verticalspace(4),
                          AppTextFormField(
                            hinttText: "Isaac",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "First name is required";
                              }
                              return null;
                            },
                            controller: firstNameController,
                          ),
                          Text(
                            "Last Name",
                            style: AppTextStyle.font14meduimbluegray,
                          ),
                          verticalspace(4),
                          AppTextFormField(
                            hinttText: "Isaac",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Last name is required";
                              }
                              return null;
                            },
                            controller: lastNameController,
                          ),
                          verticalspace(16),
                          Text(
                            "Email",
                            style: AppTextStyle.font14meduimbluegray,
                          ),
                          verticalspace(4),
                          AppTextFormField(
                            hinttText: "isaac.newton@cambridge.edu",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }

                              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                              if (!emailRegex.hasMatch(value)) {
                                return "Enter a valid email";
                              }

                              return null;
                            },
                            controller: emailController,
                          ),
                          verticalspace(16),
                          Text(
                            "password",
                            style: AppTextStyle.font14meduimbluegray,
                          ),

                          verticalspace(4),
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
                            hinttText: "••••••••",
                          ),
                          verticalspace(16),
                          Text(
                            "verify Password",
                            style: AppTextStyle.font14meduimbluegray,
                          ),

                          verticalspace(4),
                          AppTextFormField(
                            hinttText: "••••••••",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please confirm your password";
                              }
                              if (value != passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            controller: verifyPasswordController,
                          ),
                          verticalspace(16),
                          Text(
                            "Field of Study",
                            style: AppTextStyle.font14meduimbluegray,
                          ),

                          verticalspace(4),
                          AppTextFormField(
                            hinttText: "Computer Science",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Field of study is required";
                              }
                              return null;
                            },
                            controller: fieldOfStudy,
                          ),
                          verticalspace(16),
                          Text(
                            "Academic Status",
                            style: AppTextStyle.font14meduimbluegray,
                          ),

                          verticalspace(4),
                          DropDownMenue(
                            value: selectedAcademicStatus,
                            onChanged: (newValue) {
                              setState(() {
                                selectedAcademicStatus = newValue!;
                              });
                            },
                          ),
                          verticalspace(16),
                          Text(
                            "Institution",
                            style: AppTextStyle.font14meduimbluegray,
                          ),

                          verticalspace(4),
                          AppTextFormField(
                            controller: institutionController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Institution is required";
                              }
                              return null;
                            },
                            hinttText: "University of Cambridge",
                          ),

                          verticalspace(20),
                          AgreeOnTermsAndConditions(),
                          verticalspace(21),
                          BlocConsumer<SignupCubit, SignupState>(
                            listener: (context, state) {
                              if (state is SignUpSuccess) {
                                SnackBarHelper.showSuccess(
                                  context,
                                  'SignUp successful',
                                );

                                context.pushAndRemoveUntil(
                                  Routes.loginScreen,
                                  predicate: (Route<dynamic> route) => false,
                                );
                              }

                              if (state is SignUpFailure) {
                                SnackBarHelper.showError(
                                  context,
                                  state.errorMasege,
                                );
                              }
                            },
                            builder: (context, state) {
                              final isLoading = state is SignUpLoading;
                              return AppTextButton(
                                buttonText: "Create My Account",
                                onPressed: isLoading ? null : _register,
                                isLoading: isLoading,
                                horizontalPadaing: 80,
                              );
                            },
                          ),
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
