import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';

class MyProfileRepo {
  final ApiServices apiServices;

  MyProfileRepo({required this.apiServices});
  Future<Either<Failure, User>> getUserProfile() async {
    try {
      final response = await apiServices.getData(url: ApiLink.getMyProfile);
      final user = User.fromJson(Map<String, dynamic>.from(response));
      return Right(user);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(ServerFailure('Unexpected error'));
    }
  }
}
