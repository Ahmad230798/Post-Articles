import 'package:equatable/equatable.dart';
import 'package:flutter_project/features/saved/models/saved_articals_model.dart';

abstract class SavedArticalsState extends Equatable {
  const SavedArticalsState();
  @override
  List<Object?> get props => [];
}

class SavedArticalsStateinit extends SavedArticalsState {
  const SavedArticalsStateinit();
}

class SavedArticalsStateLoading extends SavedArticalsState {
  const SavedArticalsStateLoading();
}

class SavedArticalsStateFailure extends SavedArticalsState {
  final String errorMassege;
  const SavedArticalsStateFailure(this.errorMassege);
  @override
  List<Object?> get props => [errorMassege];
}

class SavedArticalsStateSuccess extends SavedArticalsState {
  final List<SavedArticleModel> articals;
  const SavedArticalsStateSuccess(this.articals);
  @override
  List<Object?> get props => [articals];
}
