import 'package:flutter_bloc/flutter_bloc.dart';
import 'explore_state.dart';
import 'package:flutter_project/features/home/models/article_model.dart';

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
        slug: "article-$i",
        title: "Trending Article $i",
        description: "This is a short description for article $i",
        coverImage: "https://picsum.photos/400/300?$i",
        categoryName: "Tech",
        authorName: "Author $i",
        readTime: 5,
        likesCount: i * 10,
        commentsCount: i * 2,
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
        slug: "more-${state.articles.length + i}",
        title: "More Article ${state.articles.length + i}",
        description: "Extra description",
        coverImage: "https://picsum.photos/400/300?more$i",
        categoryName: "Tech",
        authorName: "Author ${state.articles.length + i}",
        readTime: 4,
        likesCount: i * 5,
        commentsCount: i * 3,
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
