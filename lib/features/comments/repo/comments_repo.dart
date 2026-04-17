import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/features/comments/models/comments_model.dart';

class CommentsRepo {
  final ApiServices api;
  CommentsRepo({required this.api});

  Future<Either<Failure, List<CommentModel>>> getComments(String slug) async {
    try {
      final response = await api.getData(
        url: "${ApiLink.baseUrl}/articles/$slug/comments/",
      );
      final List results = response['results'] ?? [];
      final comments = results.map((e) => CommentModel.fromJson(e)).toList();
      return Right(comments);
    } on ServerFailure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, CommentModel>> addComment(
    String slug,
    String text,
  ) async {
    try {
      final response = await api.postData(
        url: "${ApiLink.baseUrl}/articles/$slug/comments/",
        body: {"content": text},
      );

      // 🔵 response هو Map جاهز، ما فيه data
      return Right(CommentModel.fromJson(response));
    } on ServerFailure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, String>> likeComment(int commentId) async {
    try {
      await api.postData(url: "${ApiLink.baseUrl}/comments/$commentId/like/");
      return Right("Liked");
    } on ServerFailure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
