import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/user_profile/logic/cubit/user_profile_state.dart';
import 'package:flutter_project/features/user_profile/repo/user_profile_repo.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final String username;
  final UserProfileRepo repo;

  UserProfileCubit(this.repo, this.username) : super(const UserprofileInit());

  Future<void> getUserProfile() async {
    emit(const UserProfileLoading());

    final result = await repo.getUserProfile(username);

    result.fold(
      (failure) {
        emit(UserProfileFailure(errorMassege: failure.errorMessage));
      },
      (user) {
        emit(
          UserProfileSuccess(
            user: user,
            isFollowing: false,
            isFollowingLoading: false,
          ),
        );
      },
    );
  }

  Future<void> follow() async {
    final currentState = state;

    if (currentState is! UserProfileSuccess) return;

    emit(
      UserProfileSuccess(
        user: currentState.user,
        isFollowing: currentState.isFollowing,
        isFollowingLoading: true,
      ),
    );

    final result = await repo.follow(username);

    result.fold(
      (failure) {
        emit(
          UserProfileSuccess(
            user: currentState.user,
            isFollowing: currentState.isFollowing,
            isFollowingLoading: false,
          ),
        );
      },
      (message) {
        emit(
          UserProfileSuccess(
            user: currentState.user,
            isFollowing: message == "Followed.",
            isFollowingLoading: false,
          ),
        );

        getUserProfile();
      },
    );
  }
}
