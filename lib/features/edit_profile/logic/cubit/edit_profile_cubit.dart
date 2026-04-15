import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';
import 'package:flutter_project/features/edit_profile/data/model/edited_profile_request_model.dart';
import 'package:flutter_project/features/edit_profile/logic/cubit/edit_profile_state.dart';
import 'package:flutter_project/features/edit_profile/repo/edit_profile_repo.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo repo;

  EditProfileCubit(this.repo) : super(const EditProfileInitial());

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final bioController = TextEditingController();
  final institutionController = TextEditingController();
  final locationController = TextEditingController();
  final orcidIDController = TextEditingController();
  final websiteController = TextEditingController();
  final filedOfStudycontroller = TextEditingController();

  String selectedAcademicStatus = 'researcher';

  Future<void> getProfileInfo() async {
    emit(const EditProfileLoading());

    final result = await repo.getprofileinfo();

    result.fold(
      (failure) {
        emit(EditProfileFailure(failure.errorMessage));
      },
      (profile) {
        _fillControllers(profile);

        selectedAcademicStatus = profile.academicStatus;

        emit(EditProfileLoaded(profile: profile, isSubmitting: false));
      },
    );
  }

  Future<void> updateProfileInfo() async {
    final currentState = state;
    if (currentState is! EditProfileLoaded) return;

    emit(
      currentState.copyWith(
        isSubmitting: true,
        submitError: null,
        didSave: false,
      ),
    );

    final body = EditedProfileRequestModel(
      username: currentState.profile.username,
      email: currentState.profile.email,
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      bio: bioController.text.trim(),
      institution: institutionController.text.trim(),
      fieldOfStudy: currentState.profile.fieldOfStudy,
      academicStatus: selectedAcademicStatus,
      location: locationController.text.trim(),
      title: currentState.profile.title,
      orcidId: orcidIDController.text.trim(),
      website: websiteController.text.trim(),
    );

    final result = await repo.updateProfile(body);

    result.fold(
      (failure) {
        emit(
          currentState.copyWith(
            isSubmitting: false,
            submitError: failure.errorMessage,
            didSave: false,
          ),
        );
      },
      (updatedProfile) {
        _fillControllers(updatedProfile);
        selectedAcademicStatus = updatedProfile.academicStatus;

        emit(
          currentState.copyWith(
            profile: updatedProfile,
            isSubmitting: false,
            submitError: null,
            didSave: true,
          ),
        );
      },
    );
  }

  void changeAcademicStatus(String value) {
    selectedAcademicStatus = value;

    final currentState = state;
    if (currentState is EditProfileLoaded) {
      emit(currentState.copyWith(didSave: false, submitError: null));
    }
  }

  void _fillControllers(User profile) {
    firstNameController.text = profile.firstName;
    lastNameController.text = profile.lastName;
    bioController.text = profile.bio;
    institutionController.text = profile.institution;

    locationController.text = profile.location;
    orcidIDController.text = profile.orcidId;
    websiteController.text = profile.website;
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    institutionController.dispose();
    locationController.dispose();
    orcidIDController.dispose();
    websiteController.dispose();
    return super.close();
  }
}
