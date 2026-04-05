import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/auth/data/model/login_request_body.dart';
import 'package:flutter_project/features/auth/data/model/login_response.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ApiServices apiServices;

  LoginCubit(this.apiServices) : super(const LoginInitial());

  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(const LoginLoading());

    try {
      final response = await apiServices.postData(
        url: ApiLink.login, // عدلها حسب endpoint الحقيقي عندك
        body: loginRequestBody.toJson(),
      );

      final loginResponse = LoginResponse.fromJson(
        Map<String, dynamic>.from(response),
      );

      emit(LoginSuccess(loginResponse));
    } on ServerFailure catch (e) {
      emit(LoginFailure(e.errorMessage));
    } catch (e) {
      emit(LoginFailure('Something went wrong, please try again'));
    }
  }
}
