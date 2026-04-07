import 'package:equatable/equatable.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';

class SignupState extends Equatable {
  const SignupState();
  @override
  List<Object?> get props => throw UnimplementedError();
}
class SignUpitial extends SignupState {
  const SignUpitial();
}
class SignUpLoading extends SignupState {
  const SignUpLoading();
}

class SignUpSuccess extends SignupState {
  final RegisterResponse registerResponse;
  const SignUpSuccess(this.registerResponse);
  @override
  List<Object?> get props => [registerResponse];
}

class SignUpFailure extends SignupState {
  final String errorMasege;
  const SignUpFailure(this.errorMasege);
  @override
  List<Object?> get props => [errorMasege];
}
