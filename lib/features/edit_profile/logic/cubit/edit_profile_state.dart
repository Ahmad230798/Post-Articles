import 'package:equatable/equatable.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object?> get props => [];
}

class EditProfileInitial extends EditProfileState {
  const EditProfileInitial();
}

class EditProfileLoading extends EditProfileState {
  const EditProfileLoading();
}

class EditProfileLoaded extends EditProfileState {
  final User profile;
  final bool isSubmitting;
  final String? submitError;
  final bool didSave;

  const EditProfileLoaded({
    required this.profile,
    required this.isSubmitting,
    this.submitError,
    this.didSave = false,
  });

  EditProfileLoaded copyWith({
    User? profile,
    bool? isSubmitting,
    String? submitError,
    bool? didSave,
  }) {
    return EditProfileLoaded(
      profile: profile ?? this.profile,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      submitError: submitError,
      didSave: didSave ?? this.didSave,
    );
  }

  @override
  List<Object?> get props => [profile, isSubmitting, submitError, didSave];
}

class EditProfileFailure extends EditProfileState {
  final String errorMessage;

  const EditProfileFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
