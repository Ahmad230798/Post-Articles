import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_request_body.dart';
import 'package:flutter_project/features/auth/logic/cubit/signup_state.dart';
import 'package:flutter_project/features/auth/repo/auth_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo _authRepo;
  SignupCubit(this._authRepo) : super(SignUpitial());
  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final institutionController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();
  final fieldOfStudyController = TextEditingController();

  String selectedAcademicStatus = 'graduate';

  void changeAcademicStatus(String value) {
    selectedAcademicStatus = value;
    emit(SignUpitial());
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    institutionController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
    fieldOfStudyController.dispose();
    return super.close();
  }

  Future<void> signUp(RegisterRequestBody body) async {
    emit(SignUpLoading());

    final result = await _authRepo.register(body);

    result.fold(
      (failure) {
        emit(SignUpFailure(failure.errorMessage));
      },
      (registerResponse) {
        emit(SignUpSuccess(registerResponse));
      },
    );
  }
}
