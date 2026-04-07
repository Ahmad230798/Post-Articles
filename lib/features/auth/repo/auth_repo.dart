import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/core/services/services.dart';
import 'package:flutter_project/features/auth/data/model/login_model/login_request_body.dart';
import 'package:flutter_project/features/auth/data/model/login_model/login_response.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_request_body.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';

class AuthRepo {
  final ApiServices apiServices;
  final SharedPreferencesService _pref;

  AuthRepo(this.apiServices, this._pref);
  Future<LoginResponse> login(LoginRequestBody body) async {
    try {
      final response = await apiServices.postData(
        url: ApiLink.login,
        body: body.toJson(),
      );
      final loginResponse = LoginResponse.fromJson(
        Map<String, dynamic>.from(response),
      );
      await _pref.saveTokens(
        accessToken: loginResponse.access,
        refreshToken: loginResponse.refresh,
      );
      return loginResponse;
    } on ServerFailure {
      rethrow;
    } catch (_) {
      throw ServerFailure('Unexpected error');
    }
  }

  Future<RegisterResponse> register(
    RegisterRequestBody registerRequestBody,
  ) async {
    try {
      final response = await apiServices.postData(
        url: ApiLink.register,
        body: registerRequestBody.toJson(),
      );
      final registerResponse = RegisterResponse.fromJson(
        Map<String, dynamic>.from(response),
      );
      return registerResponse;
    } on ServerFailure {
      rethrow;
    } catch (_) {
      throw ServerFailure("Unexpected error");
    }
  }
}
