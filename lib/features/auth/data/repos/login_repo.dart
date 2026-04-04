import 'package:flutter_project/core/networking/api_error_handler.dart';
import 'package:flutter_project/core/networking/api_result.dart';
import 'package:flutter_project/core/networking/api_services.dart';
import 'package:flutter_project/features/auth/data/model/login_request_body.dart';
import 'package:flutter_project/features/auth/data/model/login_response.dart';

class LoginRepo {
  final ApiServices _apiServices;
  LoginRepo(this._apiServices);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body ) async {
    try {
      final response = await _apiServices.login(body);
      return ApiResult.success(response);

    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
