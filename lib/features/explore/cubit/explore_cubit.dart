import 'package:flutter_bloc/flutter_bloc.dart';
import 'explore_state.dart';
import '../models/article_model.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(const ExploreState());

  void updateSearch(String query) {
    emit(state.copyWith(searchQuery: query, page: 1));
    fetchArticles();
  }

  void selectCategory(int index) {
    emit(state.copyWith(selectedCategory: index, page: 1));
    fetchArticles();
  }

  void updateSort(String sort) {
    emit(state.copyWith(selectedSort: sort, page: 1));
    fetchArticles();
  }

  void updateRating(int rating) {
    emit(state.copyWith(selectedRating: rating, page: 1));
    fetchArticles();
  }

  void resetFilters() {
    emit(const ExploreState());
    fetchArticles();
  }

  void applyFilters(ExploreState filters) {
    emit(
      state.copyWith(
        searchQuery: filters.searchQuery,
        selectedCategory: filters.selectedCategory,
        selectedSort: filters.selectedSort,
        selectedRating: filters.selectedRating,
        page: 1,
      ),
    );
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    emit(state.copyWith(isLoading: true));

    // 🔥 هون رح تحط API أو Repository لجلب المقالات
    await Future.delayed(const Duration(seconds: 1));

    final dummyArticles = List.generate(
      5,
      (i) => ArticleModel(
        id: i,
        title: "Trending Article $i",
        category: "Tech",
        image:
            "assets/images/articles/article${i + 1}.png", // ← يطابق الموجود عندك
        readTime: "5 min read",
        description: "This is a short description for article $i",
        likes: "${i * 10}",
        shares: "${i * 2}",
        authorName: "Author $i",
        authorAvatar: "assets/images/profile.png", // ← يطابق الموجود عندك
      ),
    );

    emit(
      state.copyWith(articles: dummyArticles, isLoading: false, hasMore: true),
    );
  }

  Future<void> loadMoreArticles() async {
    if (!state.hasMore || state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1));

    final moreArticles = List.generate(
      5,
      (i) => ArticleModel(
        id: state.articles.length + i,
        title: "More Article ${state.articles.length + i}",
        category: "Tech",
        image: "assets/images/article_${state.articles.length + i}.jpg",
        readTime: "4 min read",
        description: "Extra description",
        likes: "${i * 5}",
        shares: "${i * 3}",
        authorName: "Author ${state.articles.length + i}",
        authorAvatar: "assets/images/profile.png",
      ),
    );

    emit(
      state.copyWith(
        articles: [...state.articles, ...moreArticles],
        isLoading: false,
        page: state.page + 1,
      ),
    );
  }
}
