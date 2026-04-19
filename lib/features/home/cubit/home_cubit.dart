import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/home/cubit/home_state.dart';
import 'package:flutter_project/features/home/repository/article_repository.dart';
import 'package:flutter_project/features/home/repository/category_repository.dart';
import 'package:flutter_project/features/home/models/category_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    loadInitialData();
  }

  final ArticleRepository _articleRepo = ArticleRepository();
  final CategoryRepository _categoryRepo = CategoryRepository();

  // 🔥 كاتيغوري Featured الوهمية
  static const featuredCategory = CategoryModel(
    id: -1,
    name: "Featured",
    slug: "featured",
    icon: null,
    description: null,
  );

  Future<void> loadInitialData() async {
    emit(state.copyWith(isLoading: true));

    try {
      final categories = await _categoryRepo.getCategories();
      final articles = await _articleRepo.getArticles();

      // 🔥 فلترة المقالات حسب is_featured
      final featured = articles.where((a) => a.isFeatured == true).toList();

      // 🔥 إضافة Featured دائماً قبل الكاتيغوريز
      final uiCategories = [featuredCategory, ...categories];

      emit(
        state.copyWith(
          categories: uiCategories,
          activeCategory: 0, // Featured دائماً الافتراضية
          featuredArticle: null,
          articles: featured,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void changeCategory(int index) {
    emit(state.copyWith(activeCategory: index));
    loadArticlesForCategory(index);
  }

  Future<void> loadArticlesForCategory(int index) async {
    emit(state.copyWith(isLoading: true, featuredArticle: null, articles: []));

    try {
      final category = state.categories[index];

      // 🔥 إذا الكاتيغوري هي Featured
      if (category.slug == "featured") {
        final all = await _articleRepo.getArticles();
        final featured = all.where((a) => a.isFeatured == true).toList();

        emit(state.copyWith(articles: featured, isLoading: false));
        return;
      }

      // 🔥 غير هيك → كاتيغوري عادية
      final response = await _articleRepo.getArticlesByCategory(category.slug);

      emit(state.copyWith(articles: response, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
