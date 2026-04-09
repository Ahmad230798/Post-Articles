import 'package:bloc/bloc.dart';
import 'package:flutter_project/features/my_profile/logic/cubit/my_profile_state.dart';
import 'package:flutter_project/features/my_profile/repo/my_profile_repo.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  final MyProfileRepo profileRepo;

  MyProfileCubit(this.profileRepo) : super(MyprofileInit());
  Future<void> getMyProfile() async {
    emit(LoadingState());
    final result = await profileRepo.getUserProfile();
    result.fold(
      (failure) => emit(FailureState(failure.errorMessage)),

      (user) => emit(SuccessState(user)),
    );
  }
}
