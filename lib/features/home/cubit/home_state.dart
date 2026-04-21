import 'package:equatable/equatable.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';
import 'package:flutter_project/features/home/models/article_model.dart';
import 'package:flutter_project/features/home/models/category_model.dart';

class HomeState extends Equatable {
  final int activeCategory;
  final bool isLoading;
  final ArticleModel? featuredArticle;
  final List<ArticleModel> articles;
  final List<CategoryModel> categories;
  final User? user;

  const HomeState({
    this.activeCategory = 0,
    this.isLoading = false,
    this.featuredArticle,
    this.articles = const [],
    this.categories = const [],
    this.user,
  });

  HomeState copyWith({
    int? activeCategory,
    bool? isLoading,
    ArticleModel? featuredArticle,
    List<ArticleModel>? articles,
    List<CategoryModel>? categories,
    User? user,
  }) {
    return HomeState(
      activeCategory: activeCategory ?? this.activeCategory,
      isLoading: isLoading ?? this.isLoading,
      featuredArticle: featuredArticle ?? this.featuredArticle,
      articles: articles ?? this.articles,
      categories: categories ?? this.categories,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
    activeCategory,
    isLoading,
    featuredArticle,
    articles,
    categories,
    user,
  ];
}
