import 'package:equatable/equatable.dart';
import 'package:flutter_project/features/comments/models/comments_model.dart'
    show CommentModel;

abstract class CommentsState extends Equatable {
  const CommentsState();
  @override
  List<Object?> get props => [];
}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsFailure extends CommentsState {
  final String error;
  const CommentsFailure(this.error);
  @override
  List<Object?> get props => [error];
}

class CommentsSuccess extends CommentsState {
  final List<CommentModel> comments;
  const CommentsSuccess(this.comments);
  @override
  List<Object?> get props => [comments];
}
