import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/helpers/snack_bar_helper.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/features/auth/logic/cubit/login_cubit.dart';
import 'package:flutter_project/features/auth/logic/cubit/login_state.dart';
import 'package:flutter_project/features/auth/widget/log_in_form.dart';
import 'package:flutter_project/features/auth/widget/log_in_header.dart';
import 'package:flutter_project/features/auth/widget/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LogInHeader(),
                verticalspace(40),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      SnackBarHelper.showSuccess(context, 'Login successful');

                      context.pushAndRemoveUntil(
                        Routes.main,
                        predicate: (Route<dynamic> route) => false,
                      );
                    }

                    if (state is LoginFailure) {
                      SnackBarHelper.showError(context, state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is LoginLoading;

                    return LogInForm(
                      formKey: formKey,
                      cubit: cubit,
                      isLoading: isLoading,
                    );
                  },
                ),
                verticalspace(32),
                TermsAndConditionsText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
