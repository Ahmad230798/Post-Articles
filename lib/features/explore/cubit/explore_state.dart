import 'package:equatable/equatable.dart';
import '../models/article_model.dart';

class ExploreState extends Equatable {
  final String searchQuery;
  final int selectedCategory;
  final String selectedSort;
  final int selectedRating;
  final List<ArticleModel> articles;
  final bool isLoading;
  final bool hasMore;
  final int page;

  const ExploreState({
    this.searchQuery = '',
    this.selectedCategory = 0,
    this.selectedSort = 'Most Popular',
    this.selectedRating = 0,
    this.articles = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.page = 1,
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
  ];
}
