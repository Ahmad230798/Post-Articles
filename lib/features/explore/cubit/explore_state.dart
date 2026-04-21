import 'package:equatable/equatable.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';
import 'package:flutter_project/features/home/models/article_model.dart';

class ExploreState extends Equatable {
  final String searchQuery;
  final int selectedCategory;
  final String selectedSort;
  final int selectedRating;
  final List<ArticleModel> articles;
  final bool isLoading;
  final bool hasMore;
  final int page;
  final String? selectedCategorySlug;
  final User? user;
  const ExploreState({
    this.searchQuery = '',
    this.selectedCategory = 0,
    this.selectedSort = "Most Relevant",
    this.selectedRating = 0,
    this.articles = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.page = 1,
    this.selectedCategorySlug,
    this.user,
  });

  ExploreState copyWith({
    String? searchQuery,
    int? selectedCategory,
    String? selectedSort,
    int? selectedRating,
    List<ArticleModel>? articles,
    bool? isLoading,
    bool? hasMore,
    int? page,
    String? selectedCategorySlug,
    final User? user,
  }) {
    return ExploreState(
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSort: selectedSort ?? this.selectedSort,
      selectedRating: selectedRating ?? this.selectedRating,
      articles: articles ?? this.articles,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
    searchQuery,
    selectedCategory,
    selectedSort,
    selectedRating,
    articles,
    isLoading,
    hasMore,
    page,
    selectedCategorySlug,

    user,
  ];
}
