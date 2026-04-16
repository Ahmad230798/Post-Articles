import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/saved/models/saved_articals_model.dart';

class SavedArticalsRepo {
  final ApiServices api;

  SavedArticalsRepo({required this.api});
 Future<Either<Failure, List<SavedArticleModel>>> getSavedArticals() async {
  try {
    final response = await api.getData(url: ApiLink.getMySavedArticls);

    final List<dynamic> results = response['results'] ?? [];

    final savedArticles = results
        .map((e) => SavedArticleModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    return Right(savedArticles);
  } on ServerFailure catch (error) {
    return Left(error);
  } catch (error) {
    return Left(ServerFailure(error.toString()));
  }
}
}
