import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/data/model/login_model/login_request_body.dart';
import 'package:flutter_project/features/auth/repo/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo loginRepo;

  LoginCubit(this.loginRepo) : super(const LoginInitial());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObscure = true;
  bool rememberMe = false;
  void togglePasswordVisibility() {
    isObscure = !isObscure;
    emit(LoginInitial());
  }

  void toggleRememberMe(bool value) {
    rememberMe = value;
    emit(LoginInitial());
  }

  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(const LoginLoading());

    final result = await loginRepo.login(loginRequestBody);
    result.fold(
      (failure) {
        emit(LoginFailure(failure.errorMessage));
      },
      (loginResponse) {
        emit(LoginSuccess(loginResponse));
      },
    );
  }
}
