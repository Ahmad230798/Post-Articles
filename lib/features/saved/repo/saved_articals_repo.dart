import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/home/models/article_model.dart';

class SavedArticalsRepo {
  final ApiServices api;

  SavedArticalsRepo({required this.api});
  Future<Either<Failure, List<ArticleModel>>> getSavedArticals() async {
    try {
      final response = await api.getData(url: ApiLink.getMySavedArticls);
      final List results = response['results'] ?? [];
      final result = results.map((e) => ArticleModel.fromJson(e)).toList();
      return Right(result);
    } on ServerFailure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
