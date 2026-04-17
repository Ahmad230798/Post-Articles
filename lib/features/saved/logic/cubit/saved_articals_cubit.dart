import 'package:bloc/bloc.dart';
import 'package:flutter_project/features/saved/logic/cubit/saved_articals_state.dart';
import 'package:flutter_project/features/saved/repo/saved_articals_repo.dart';

class SavedArticalsCubit extends Cubit<SavedArticalsState> {
  final SavedArticalsRepo repo;
  SavedArticalsCubit(this.repo) : super(const SavedArticalsStateinit());

  Future<void> getSavedArticals() async {
    emit(const SavedArticalsStateLoading());
    final result = await repo.getSavedArticals();
    result.fold(
      (failure) => emit(SavedArticalsStateFailure(failure.errorMessage)),
      (articles) => emit(SavedArticalsStateSuccess(articles)),
    );
  }

  Future<void> unbookmark(String slug) async {
    final currentState = state;
    if (currentState is! SavedArticalsStateSuccess) return;

    final result = await repo.unbookmarkArticle(slug);
    result.fold(
      (failure) => emit(SavedArticalsStateFailure(failure.errorMessage)),
      (_) {
        final updatedList = currentState.articals
            .where((a) => a.article.slug != slug)
            .toList();
        emit(SavedArticalsStateSuccess(updatedList));
      },
    );
  }
}
