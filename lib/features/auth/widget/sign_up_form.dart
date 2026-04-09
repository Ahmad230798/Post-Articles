
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/helpers/snack_bar_helper.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/core/widgets/app_text_button.dart';
import 'package:flutter_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_request_body.dart';
import 'package:flutter_project/features/auth/logic/cubit/signup_cubit.dart';
import 'package:flutter_project/features/auth/logic/cubit/signup_state.dart';
import 'package:flutter_project/features/auth/widget/agree_on_terms_and_conditions.dart';
import 'package:flutter_project/features/auth/widget/drop_down_menue.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.cubit,
  });

  final GlobalKey<FormState> formKey;
  final SignupCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                controller: cubit.userNameController,
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
                controller: cubit.firstNameController,
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
                controller: cubit.lastNameController,
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
                controller: cubit.emailController,
              ),
              verticalspace(16),
              Text(
                "password",
                style: AppTextStyle.font14meduimbluegray,
              ),
              verticalspace(4),
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
                  if (value !=
                          cubit.verifyPasswordController.text &&
                      value != cubit.passwordController.text) {
                    return "Passwords do not match";
                  }
                  if (value != cubit.passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                controller: cubit.verifyPasswordController,
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
                controller: cubit.fieldOfStudyController,
              ),
              verticalspace(16),
              Text(
                "Academic Status",
                style: AppTextStyle.font14meduimbluegray,
              ),
              verticalspace(4),
              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  return DropDownMenue(
                    value: cubit.selectedAcademicStatus,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        context
                            .read<SignupCubit>()
                            .changeAcademicStatus(newValue);
                      }
                    },
                  );
                },
              ),
              verticalspace(16),
              Text(
                "Institution",
                style: AppTextStyle.font14meduimbluegray,
              ),
              verticalspace(4),
              AppTextFormField(
                controller: cubit.institutionController,
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
                    onPressed: isLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              cubit.signUp(
                                RegisterRequestBody(
                                  username: cubit
                                      .userNameController
                                      .text
                                      .trim(),
                                  email: cubit.emailController.text
                                      .trim(),
                                  password: cubit
                                      .passwordController
                                      .text
                                      .trim(),
                                  password2: cubit
                                      .verifyPasswordController
                                      .text
                                      .trim(),
                                  fieldOfStudy: cubit
                                      .fieldOfStudyController
                                      .text
                                      .trim(),
                                  academicStatus:
                                      cubit.selectedAcademicStatus,
                                  institution: cubit
                                      .institutionController
                                      .text
                                      .trim(),
                                  firstName: cubit
                                      .firstNameController
                                      .text
                                      .trim(),
                                  lastNmae: cubit
                                      .lastNameController
                                      .text
                                      .trim(),
                                ),
                              );
                            }
                          },
                    isLoading: isLoading,
                    horizontalPadaing: 80,
                  );
                },
              ),
             
            ],
          ),
        ),
      ],
    );
  }
}
