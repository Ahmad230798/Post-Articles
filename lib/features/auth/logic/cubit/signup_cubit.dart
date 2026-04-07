import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_request_body.dart';
import 'package:flutter_project/features/auth/logic/cubit/signup_state.dart';
import 'package:flutter_project/features/auth/repo/auth_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo _authRepo;
  SignupCubit(this._authRepo) : super(SignUpitial());
  Future<void> signUp(RegisterRequestBody registerRequestBody) async {
    emit(SignUpLoading());
    try {
      final registerResponse = await _authRepo.register(registerRequestBody);
      emit(SignUpSuccess(registerResponse));
    } on ServerFailure catch (e) {
      emit(SignUpFailure(e.errorMessage));
    } catch (_) {
      emit(SignUpFailure('Something went wrong, please try again'));
    }
  }
}
