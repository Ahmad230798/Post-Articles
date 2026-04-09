import 'package:dartz/dartz.dart';
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

  Future<Either<Failure, LoginResponse>> login(LoginRequestBody body) async {
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

      return Right(loginResponse);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(ServerFailure('Unexpected error'));
    }
  }

  Future<Either<Failure, RegisterResponse>> register(
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

      return Right(registerResponse);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(ServerFailure('Unexpected error'));
    }
  }
}