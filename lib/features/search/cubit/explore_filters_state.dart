import 'package:equatable/equatable.dart';

class ExploreFiltersState extends Equatable {
  final int selectedCategory;
  final String selectedSort;
  final int selectedRating;
  final double minPrice;
  final double maxPrice;
  final String searchQuery;
  final List<String> selectedTags;

  const ExploreFiltersState({
    this.selectedCategory = 0,
    this.selectedSort = "Most Relevant",
    this.selectedRating = 0,
    this.minPrice = 0,
    this.maxPrice = 500,
    this.searchQuery = "",
    this.selectedTags = const [],
  });

  ExploreFiltersState copyWith({
    int? selectedCategory,
    String? selectedSort,
    int? selectedRating,
    double? minPrice,
    double? maxPrice,
    String? searchQuery,
    List<String>? selectedTags,
  }) {
    return ExploreFiltersState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSort: selectedSort ?? this.selectedSort,
      selectedRating: selectedRating ?? this.selectedRating,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedTags: selectedTags ?? this.selectedTags,
    );
  }

  @override
  List<Object?> get props => [
    selectedCategory,
    selectedSort,
    selectedRating,
    minPrice,
    maxPrice,
    searchQuery,
    selectedTags,
  ];
}
