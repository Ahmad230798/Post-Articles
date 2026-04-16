// import 'package:bloc/bloc.dart';
// import 'package:flutter_project/features/home/models/article_model.dart';
// import 'package:flutter_project/features/my_profile/logic/cubit/my_profile_state.dart';
// import 'package:flutter_project/features/my_profile/repo/my_profile_repo.dart';

// class MyProfileCubit extends Cubit<MyProfileState> {
//   final MyProfileRepo profileRepo;

//   MyProfileCubit(this.profileRepo) : super(MyprofileInit());
//   Future<void> getMyProfile() async {
//     emit(LoadingState());
//     final result = await profileRepo.getUserProfile();

//     result.fold(
//       (failure) => emit(FailureState(failure.errorMessage)),

//       (user) => emit(SuccessState(user)),
//     );
//   }

//   Future<List<ArticleModel>> getMyArticals() async {
//     emit(LoadingState());
//     final result = await profileRepo.getArticles();

//     result.fold(
//       (failure) => emit(FailureState(failure.errorMessage)),

//       (articles) => emit(GetArticalsSuccessState(articles)),
//     );
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:flutter_project/features/my_profile/logic/cubit/my_profile_state.dart';
import 'package:flutter_project/features/my_profile/repo/my_profile_repo.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  final MyProfileRepo profileRepo;

  MyProfileCubit(this.profileRepo) : super(const MyProfileInitial());

  Future<void> loadMyProfile() async {
    emit(const MyProfileLoading());

    final userResult = await profileRepo.getUserProfile();

    await userResult.fold(
      (failure) async {
        emit(MyProfileFailure(failure.errorMessage));
      },
      (user) async {
        final articlesResult = await profileRepo.getArticles();

        articlesResult.fold(
          (failure) {
            emit(MyProfileFailure(failure.errorMessage));
          },
          (articles) {
            emit(MyProfileLoaded(user: user, articles: articles));
          },
        );
      },
    );
  }
}
