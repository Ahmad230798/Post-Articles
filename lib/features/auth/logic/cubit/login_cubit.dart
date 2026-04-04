import 'package:flutter_project/core/networking/api_result.dart';
import 'package:flutter_project/features/auth/data/model/login_request_body.dart';
import 'package:flutter_project/features/auth/data/model/login_response.dart';
import 'package:flutter_project/features/auth/data/repos/login_repo.dart';
import 'package:flutter_project/features/auth/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  void emitloginstate(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.failure(error:error.failure.message));
      },
    );
  }
}
