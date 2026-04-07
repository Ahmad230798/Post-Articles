import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/errors/failur_request.dart';

import 'package:flutter_project/features/auth/data/model/login_model/login_request_body.dart';

import 'package:flutter_project/features/auth/repo/auth_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo loginRepo;

  LoginCubit(this.loginRepo) : super(const LoginInitial());

  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(const LoginLoading());

    try {
      final loginResponse = await loginRepo.login(loginRequestBody);

      emit(LoginSuccess(loginResponse));
    } on ServerFailure catch (e) {
      emit(LoginFailure(e.errorMessage));
    } catch (e) {
      emit(LoginFailure('Something went wrong, please try again'));
    }
  }
}
