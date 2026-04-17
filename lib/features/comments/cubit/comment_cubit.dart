import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/comments/cubit/comment_state.dart';
import 'package:flutter_project/features/comments/models/comments_model.dart';
import 'package:flutter_project/features/comments/repo/comments_repo.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepo repo;
  CommentsCubit(this.repo) : super(CommentsInitial());

  final TextEditingController commentController = TextEditingController();

  Future<void> fetchComments(String slug) async {
    emit(CommentsLoading());
    final result = await repo.getComments(slug);
    result.fold(
      (failure) => emit(CommentsFailure(failure.errorMessage)),
      (comments) => emit(CommentsSuccess(comments)),
    );
  }

  Future<void> addComment(String slug, String text) async {
    final currentState = state;
    if (currentState is! CommentsSuccess) return;

    final result = await repo.addComment(slug, text);
    result.fold((failure) => emit(CommentsFailure(failure.errorMessage)), (
      newComment,
    ) {
      final updated = [newComment, ...currentState.comments];
      emit(CommentsSuccess(updated));
    });
  }

  /// 🔵 Toggle Like (Like/Unlike)
  Future<void> toggleLike(int commentId) async {
    final currentState = state;
    if (currentState is! CommentsSuccess) return;

    final updated = currentState.comments.map((c) {
      if (c.id == commentId) {
        return CommentModel(
          id: c.id,
          text: c.text,
          authorName: c.authorName,
          createdAt: c.createdAt,
          likesCount: c.isLiked ? c.likesCount - 1 : c.likesCount + 1,
          isLiked: !c.isLiked, // 🔵 قلب الحالة
        );
      }
      return c;
    }).toList();

    emit(CommentsSuccess(updated));

    // 🔵 استدعاء الـ API (like/unlike)
    await repo.likeComment(commentId);
  }

  @override
  Future<void> close() {
    commentController.dispose();
    return super.close();
  }
}
