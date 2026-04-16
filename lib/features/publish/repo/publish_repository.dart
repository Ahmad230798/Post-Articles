import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/api/api_services.dart';

class PublishRepository {
  final ApiServices _api;

  PublishRepository(this._api);

  /// GET CATEGORIES
  Future<List<Map<String, dynamic>>> getCategories() async {
    final res = await _api.getData(url: '${ApiLink.baseUrl}/categories/');
    return List<Map<String, dynamic>>.from(res['results'] ?? []);
  }

  /// CREATE ARTICLE
  Future<void> createArticle({
    required String title,
    String? abstractText,
    String? description,
    String? content,
    required int categoryId,
    required File coverImage,
    File? pdfFile,
    String? status,
    String? accessLevel,
    String? tags,
    String? location,
  }) async {
    final Map<String, dynamic> map = {
      'title': title,
      'category_id': categoryId,
      'cover_image': await MultipartFile.fromFile(
        coverImage.path,
        filename: coverImage.path.split('/').last,
      ),
    };

    if (abstractText != null) map['abstract'] = abstractText;
    if (description != null) map['description'] = description;
    if (content != null) map['content'] = content;
    if (status != null) map['status'] = status;
    if (accessLevel != null) map['access_level'] = accessLevel;
    if (tags != null) map['tags'] = tags;
    if (location != null) map['location'] = location;

    if (pdfFile != null) {
      map['pdf_file'] = await MultipartFile.fromFile(
        pdfFile.path,
        filename: pdfFile.path.split('/').last,
      );
    }

    final formData = FormData.fromMap(map);

    await _api.postFormData(
      url: '${ApiLink.baseUrl}/articles/',
      data: formData,
    );
  }
}
