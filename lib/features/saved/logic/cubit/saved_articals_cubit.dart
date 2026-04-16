import 'package:bloc/bloc.dart';
import 'package:flutter_project/features/saved/logic/cubit/saved_articals_state.dart';
import 'package:flutter_project/features/saved/repo/saved_articals_repo.dart';

class SavedArticalsCubit extends Cubit<SavedArticalsState> {
  final SavedArticalsRepo repo;
  SavedArticalsCubit(this.repo) : super(SavedArticalsStateinit());
  Future<void> getSavedArticals() async {
    emit(SavedArticalsStateLoading());
    final result = await repo.getSavedArticals();
    result.fold(
      (failure) => emit(SavedArticalsStateFailure(failure.errorMessage)),
      (articals) => emit(SavedArticalsStateSuccess(articals)),
    );
  }
}
