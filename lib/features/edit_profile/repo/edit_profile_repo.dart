import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';
import 'package:flutter_project/features/edit_profile/data/model/edited_profile_request_model.dart';

class EditProfileRepo {
  final ApiServices api;
  EditProfileRepo(this.api);
  Future<Either<Failure, User>> getprofileinfo() async {
    try {
      final response = await api.getData(url: ApiLink.getMyProfile);
      final user = User.fromJson(Map<String, dynamic>.from(response));
      return Right(user);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, User>> updateProfile(
    EditedProfileRequestModel body,
  ) async {
    try {
      final response = await api.putData(
        url: ApiLink.getMyProfile,
        body: body.toJson(),
      );
      final updatedUser = User.fromJson(
        Map<String, dynamic>.from(response),
      );
      return Right(updatedUser);
    } on ServerFailure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
