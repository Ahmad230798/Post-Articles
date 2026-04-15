import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/home/models/article_model.dart';
import 'article_details_state.dart';
import '../repository/article_details_repository.dart';

class ArticleDetailsCubit extends Cubit<ArticleDetailsState> {
  final ArticleDetailsRepository repo;

  final TextEditingController commentController = TextEditingController();

  ArticleDetailsCubit(this.repo) : super(const ArticleDetailsState());

  /// 🔵 Load Article
  Future<void> loadArticle(String slug) async {
    emit(state.copyWith(loading: true));

    try {
      final data = await repo.getArticleDetails(slug);
      final article = ArticleModel.fromJson(data);

      emit(
        state.copyWith(
          loading: false,
          article: article,
          isBookmarked: false, // backend doesn't return bookmark status
        ),
      );

      loadComments(slug);
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  /// 🔵 Toggle Bookmark
  Future<void> toggleBookmark(String slug) async {
    try {
      await repo.toggleBookmark(slug);
      emit(state.copyWith(isBookmarked: !state.isBookmarked));
    } catch (_) {}
  }

  /// 🔵 Load Citation
  Future<void> loadCitation(String slug) async {
    try {
      final text = await repo.getCitation(slug);
      emit(state.copyWith(citation: text));
    } catch (_) {}
  }

  /// 🔵 Load Comments
  Future<void> loadComments(String slug) async {
    try {
      final data = await repo.getComments(slug);
      emit(state.copyWith(comments: data["results"] ?? []));
    } catch (_) {}
  }

  /// 🔵 Add Comment
  Future<void> addComment(String slug, String text) async {
    try {
      await repo.addComment(slug, text);
      loadComments(slug);
    } catch (_) {
      print("COMMENT ERROR: $e");
    }
  }

  Future<void> loadRelated(String categorySlug) async {
    try {
      final list = await repo.getRelatedArticles(categorySlug);

      final relatedModels = list
          .map<ArticleModel>((e) => ArticleModel.fromJson(e))
          .toList();

      emit(state.copyWith(related: relatedModels));
    } catch (_) {}
  }
}
