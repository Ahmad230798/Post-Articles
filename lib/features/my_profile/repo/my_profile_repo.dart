// import 'package:dartz/dartz.dart';
// import 'package:flutter_project/core/errors/failur_request.dart';
// import 'package:flutter_project/core/services/api/api_link.dart';
// import 'package:flutter_project/core/services/api/api_services.dart';
// import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';
// import 'package:flutter_project/features/home/models/article_model.dart';

// class MyProfileRepo {
//   final ApiServices apiServices;

//   MyProfileRepo({required this.apiServices});
//   Future<Either<Failure, User>> getUserProfile() async {
//     try {
//       final response = await apiServices.getData(url: ApiLink.getMyProfile);
//       final user = User.fromJson(Map<String, dynamic>.from(response));
//       return Right(user);
//     } on ServerFailure catch (e) {
//       return Left(e);
//     } catch (_) {
//       return Left(ServerFailure('Unexpected error'));
//     }
//   }

//   Future<List<ArticleModel>> getArticles() async {
//     final response = await apiServices.getData(
//       url: "${ApiLink.baseUrl}/articles/my/?page_size=10",
//     );

//     final List results = response["results"] ?? [];

//     return results.map((e) => ArticleModel.fromJson(e)).toList();
//   }
// }
import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';
import 'package:flutter_project/features/home/models/article_model.dart';

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

  Future<Either<Failure, List<ArticleModel>>> getArticles() async {
    try {
      final response = await apiServices.getData(
        url: "${ApiLink.baseUrl}/articles/my/?page_size=10",
      );

      final List results = response["results"] ?? [];

      final articles = results
          .map((e) => ArticleModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      return Right(articles);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(ServerFailure('Unexpected error'));
    }
  }
}
