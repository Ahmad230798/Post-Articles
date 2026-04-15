import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/core/services/api/api_link.dart';

class ArticleDetailsRepository {
  final ApiServices _api = ApiServices();

  /// 🔵 1) Get Article Details
  Future<Map<String, dynamic>> getArticleDetails(String slug) async {
    final response = await _api.getData(
      url: "${ApiLink.baseUrl}/articles/$slug/",
    );
    return response;
  }

  /// 🔵 2) Toggle Bookmark
  Future<bool> toggleBookmark(String slug) async {
    await _api.postData(url: "${ApiLink.baseUrl}/articles/$slug/bookmark/");
    return true;
  }

  /// 🔵 3) Get Citation
  Future<String> getCitation(String slug) async {
    final response = await _api.getData(
      url: "${ApiLink.baseUrl}/articles/$slug/citation/",
    );
    return response.toString();
  }

  /// 🔵 4) Get Comments
  Future<Map<String, dynamic>> getComments(String slug) async {
    final response = await _api.getData(
      url: "${ApiLink.baseUrl}/articles/$slug/comments/",
    );
    return response;
  }

  /// 🔵 5) Add Comment
  Future<void> addComment(String slug, String text) async {
    await _api.postData(
      url: "${ApiLink.baseUrl}/articles/$slug/comments/",
      body: {"content": text},
    );
  }

  Future<List<dynamic>> getRelatedArticles(String categorySlug) async {
    final response = await _api.getData(
      url: "${ApiLink.baseUrl}/articles/?category=$categorySlug&page_size=5",
    );
    return response["results"];
  }
}
