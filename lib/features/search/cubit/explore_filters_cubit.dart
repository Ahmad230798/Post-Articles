import 'package:flutter_bloc/flutter_bloc.dart';
import 'explore_filters_state.dart';

class ExploreFiltersCubit extends Cubit<ExploreFiltersState> {
  ExploreFiltersCubit() : super(const ExploreFiltersState());

  void updateSearch(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void selectCategory(int index) {
    emit(state.copyWith(selectedCategory: index));
  }

  void updateSort(String sort) {
    emit(state.copyWith(selectedSort: sort));
  }

  void updateRating(int rating) {
    emit(state.copyWith(selectedRating: rating));
  }

  void updateRange(double min, double max) {
    emit(state.copyWith(minPrice: min, maxPrice: max));
  }

  void toggleTag(String tag) {
    final tags = List<String>.from(state.selectedTags);

    if (tags.contains(tag)) {
      tags.remove(tag);
    } else {
      tags.add(tag);
    }

    emit(state.copyWith(selectedTags: tags));
  }

  void resetFilters() {
    emit(const ExploreFiltersState());
  }
}
