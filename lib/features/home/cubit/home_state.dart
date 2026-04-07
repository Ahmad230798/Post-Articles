import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int activeCategory;
  final bool isLoading;
  final List<Map<String, dynamic>> articles;

  const HomeState({
    this.activeCategory = 0,
    this.isLoading = false,
    this.articles = const [],
  });

  HomeState copyWith({
    int? activeCategory,
    bool? isLoading,
    List<Map<String, dynamic>>? articles,
  }) {
    return HomeState(
      activeCategory: activeCategory ?? this.activeCategory,
      isLoading: isLoading ?? this.isLoading,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object?> get props => [activeCategory, isLoading, articles];
}
