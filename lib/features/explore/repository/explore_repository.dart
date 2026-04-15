import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/features/home/models/article_model.dart';

class ExploreRepository {
  final ApiServices _api = ApiServices();

  Future<Map<String, dynamic>> getArticles({
    String? search,
    String? categorySlug,
    String? ordering,
    int page = 1,
    int pageSize = 10,
  }) async {
    final queryParams = {
      if (search != null && search.isNotEmpty) "search": search,
      if (categorySlug != null && categorySlug.isNotEmpty)
        "category": categorySlug,
      if (ordering != null && ordering.isNotEmpty) "ordering": ordering,
      "page": page.toString(),
      "page_size": pageSize.toString(),
    };

    final uri = Uri.parse(
      "${ApiLink.baseUrl}/articles/",
    ).replace(queryParameters: queryParams);

    final response = await _api.getData(url: uri.toString());

    final List results = response["results"] ?? [];

    final articles = results.map((e) {
      final articleJson = e["article"] ?? e;
      return ArticleModel.fromJson(articleJson);
    }).toList();

    return {"articles": articles, "hasMore": response["next"] != null};
  }
}
