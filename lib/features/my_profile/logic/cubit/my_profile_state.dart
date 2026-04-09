
import 'package:equatable/equatable.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';

abstract class MyProfileState extends Equatable {
  const MyProfileState();

  @override
  List<Object?> get props => [];
}

class MyprofileInit extends MyProfileState {
  const MyprofileInit();
}

class LoadingState extends MyProfileState {
  const LoadingState();
}

class SuccessState extends MyProfileState {
  final User user;
  const SuccessState(this.user);
  @override
  List<Object?> get props => [user];
}

class FailureState extends MyProfileState {
  final String errorMessage;
  const FailureState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
