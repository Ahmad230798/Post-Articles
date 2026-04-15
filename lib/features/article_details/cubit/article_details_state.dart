import 'package:equatable/equatable.dart';
import 'package:flutter_project/features/home/models/article_model.dart';

class ArticleDetailsState extends Equatable {
  final bool loading;
  final String? error;
  final ArticleModel? article;
  final bool isBookmarked;
  final String? citation;
  final List<dynamic> comments;

  /// 🔵 أضف هذا
  final List<dynamic> related;

  const ArticleDetailsState({
    this.loading = false,
    this.error,
    this.article,
    this.isBookmarked = false,
    this.citation,
    this.comments = const [],
    this.related = const [], // 🔵 مهم جدًا
  });

  ArticleDetailsState copyWith({
    bool? loading,
    String? error,
    ArticleModel? article,
    bool? isBookmarked,
    String? citation,
    List<dynamic>? comments,
    List<dynamic>? related, // 🔵 أضف هذا
  }) {
    return ArticleDetailsState(
      loading: loading ?? this.loading,
      error: error,
      article: article ?? this.article,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      citation: citation ?? this.citation,
      comments: comments ?? this.comments,
      related: related ?? this.related, // 🔵 مهم
    );
  }

  @override
  List<Object?> get props => [
    loading,
    error,
    article,
    isBookmarked,
    citation,
    comments,
    related, // 🔵 أضف هذا
  ];
}
