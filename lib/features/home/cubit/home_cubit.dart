import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';
import '../ui/home_screen.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void changeCategory(int index) {
    emit(state.copyWith(activeCategory: index));
    loadArticlesForCategory(index);
  }

  void loadArticlesForCategory(int index) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 500)); // mock loading

    // لاحقاً رح نجيبها من API
    final mockData = demoArticles;

    emit(state.copyWith(isLoading: false, articles: mockData));
  }
}
