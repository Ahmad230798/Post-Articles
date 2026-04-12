import 'package:equatable/equatable.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object?> get props => [];
}

class UserprofileInit extends UserProfileState {
  const UserprofileInit();
}

class UserProfileLoading extends UserProfileState {
  const UserProfileLoading();
}

class UserProfileSuccess extends UserProfileState {
  final User user;
  final bool isFollowing;
  final bool isFollowingLoading;

  const UserProfileSuccess({
    required this.user,
    required this.isFollowing,
    required this.isFollowingLoading,
  });

  @override
  List<Object?> get props => [user, isFollowing, isFollowingLoading];
}

class UserProfileFailure extends UserProfileState {
  final String errorMassege;

  const UserProfileFailure({required this.errorMassege});

  @override
  List<Object?> get props => [errorMassege];
}
