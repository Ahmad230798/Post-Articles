import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';
import 'package:flutter_project/features/user_profile/data/model/user_profile_modle.dart';

class UserProfileRepo {
  final ApiServices apiServices;

  UserProfileRepo(this.apiServices);

  Future<Either<Failure, User>> getUserProfile(String username) async {
    try {
      final response = await apiServices.getData(
        url: ApiLink.getUserProfile(username),
      );

      final user = User.fromJson(Map<String, dynamic>.from(response));
      return right(user);
    } on ServerFailure catch (errorMessage) {
      return left(errorMessage);
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, String>> follow(String username) async {
    try {
      final response = await apiServices.postData(
        url: ApiLink.followUser(username),
      );

      final message = UserProfileModle.fromjson(
        Map<String, dynamic>.from(response),
      );

      return Right(message.message);
    } on ServerFailure catch (errorMessage) {
      return left(errorMessage);
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
