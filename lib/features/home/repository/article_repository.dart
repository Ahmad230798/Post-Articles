import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/home/models/article_model.dart';
import 'package:flutter_project/core/services/api/api_link.dart';

class ArticleRepository {
  final ApiServices _api = ApiServices();

  /// جلب أول 10 مقالات فقط
  Future<List<ArticleModel>> getArticles() async {
    final response = await _api.getData(
      url: "${ApiLink.baseUrl}/articles/?page_size=10",
    );

    final List results = response["results"] ?? [];

    return results.map((e) => ArticleModel.fromJson(e)).toList();
  }

  Future<List<ArticleModel>> getArticlesByCategory(String slug) async {
    final response = await _api.getData(
      url: "${ApiLink.baseUrl}/articles/?category=$slug&page_size=10",
    );

    final List results = response["results"] ?? [];

    return results.map((e) => ArticleModel.fromJson(e)).toList();
  }
}
