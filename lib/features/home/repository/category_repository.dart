import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/features/home/models/category_model.dart';

class CategoryRepository {
  final ApiServices _api = ApiServices();

  Future<List<CategoryModel>> getCategories() async {
    final response = await _api.getData(url: "${ApiLink.baseUrl}/categories/");

    final List results = response["results"] ?? [];

    return results.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
