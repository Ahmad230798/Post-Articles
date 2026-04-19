import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/explore/cubit/explore_state.dart';
import 'package:flutter_project/features/explore/repository/explore_repository.dart';
import 'package:flutter_project/features/home/models/category_model.dart';
import 'package:flutter_project/features/search/cubit/explore_filters_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final ExploreRepository _repo = ExploreRepository();

  ExploreCubit() : super(const ExploreState(user: null));

  // 🔹 تحويل sort UI → ordering API
  String _mapSortToOrdering(String sort) {
    switch (sort) {
      case "Newest Arrivals":
        return "-published_at";
      case "Price: High to Low":
        return "-likes_count"; // أو أي شي بدك
      case "Most Relevant":
      default:
        return "-views_count";
    }
  }

  // 🔹 جلب المقالات الأساسية
  Future<void> fetchArticles() async {
    emit(state.copyWith(isLoading: true, page: 1));

    final ordering = _mapSortToOrdering(state.selectedSort);

    final result = await _repo.getArticles(
      search: state.searchQuery,
      categorySlug: state.selectedCategorySlug,
      ordering: ordering,
      page: 1,
      pageSize: 10,
    );

    emit(
      state.copyWith(
        articles: result["articles"],
        hasMore: result["hasMore"],
        isLoading: false,
        page: 1,
      ),
    );
  }

  // 🔹 تحميل المزيد (pagination)
  Future<void> loadMoreArticles() async {
    if (!state.hasMore || state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final ordering = _mapSortToOrdering(state.selectedSort);

    final result = await _repo.getArticles(
      search: state.searchQuery,
      categorySlug: state.selectedCategorySlug,
      ordering: ordering,
      page: state.page + 1,
      pageSize: 10,
    );

    emit(
      state.copyWith(
        articles: [...state.articles, ...result["articles"]],
        hasMore: result["hasMore"],
        isLoading: false,
        page: state.page + 1,
      ),
    );
  }

  // 🔹 Search
  void updateSearch(String query) {
    emit(state.copyWith(searchQuery: query, page: 1));
    fetchArticles();
  }

  // 🔹 Category
  void selectCategory(int index, List<CategoryModel> categories) {
    final slug = categories[index].slug;
    emit(
      state.copyWith(
        selectedCategory: index,
        selectedCategorySlug: slug,
        page: 1,
      ),
    );
    fetchArticles();
  }

  // 🔹 Sort
  void updateSort(String sort) {
    emit(state.copyWith(selectedSort: sort, page: 1));
    fetchArticles();
  }

  // 🔹 Rating (إذا بدك تربطه لاحقاً)
  void updateRating(int rating) {
    emit(state.copyWith(selectedRating: rating, page: 1));
    fetchArticles();
  }

  // 🔹 Reset
  void resetFilters() {
    emit(const ExploreState(user: null));
    fetchArticles();
  }

  // 🔹 Apply Filters
  void applyFilters(ExploreFiltersState filters) {
    emit(
      state.copyWith(
        searchQuery: filters.searchQuery,
        selectedCategory: filters.selectedCategory,
        selectedCategorySlug: filters.selectedCategorySlug,
        selectedSort: filters.selectedSort,
        selectedRating: filters.selectedRating,
        page: 1,
      ),
    );

    fetchArticles();
  }
}
