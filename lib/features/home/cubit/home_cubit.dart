import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/home/cubit/home_state.dart';
import 'package:flutter_project/features/home/repository/article_repository.dart';
import 'package:flutter_project/features/home/repository/category_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    loadInitialData();
  }

  final ArticleRepository _articleRepo = ArticleRepository();
  final CategoryRepository _categoryRepo = CategoryRepository();

  Future<void> loadInitialData() async {
    emit(state.copyWith(isLoading: true));

    try {
      final categories = await _categoryRepo.getCategories();
      final articles = await _articleRepo.getArticles();

      emit(
        state.copyWith(
          categories: categories,
          featuredArticle: articles.isNotEmpty ? articles.first : null,
          articles: articles.length > 1 ? articles.skip(1).toList() : [],
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
    emit(state.copyWith(isLoading: true));

    try {
      final category = state.categories[index];
      final response = await _articleRepo.getArticlesByCategory(category.slug);

      emit(
        state.copyWith(
          featuredArticle: response.isNotEmpty ? response.first : null,
          articles: response.length > 1 ? response.skip(1).toList() : [],
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
