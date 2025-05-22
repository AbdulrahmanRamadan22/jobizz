import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/features/auth/reset_password_screen/logic/cubit/resetpassword_state.dart';

import '../../../../../core/cache/constants.dart';
import '../../../../../core/cache/shared_pref.dart';
import '../../data/model/reset_password_requast.dart';
import '../../data/repo/reset_password_repo.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _resetPasswordRepo;
  ResetPasswordCubit(this._resetPasswordRepo)
      : super(const ResetPasswordState.initial());

  var formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  // TextEditingController confirmPasswordController = TextEditingController();
  void emitResetPassword() async {
    emit(const ResetPasswordState.loading());

    final response = await _resetPasswordRepo.resetPasswordValid(
        ResetPasswordRequest(
          newPasswordConfirmation: newPasswordController.text,
          newPassword: newPasswordController.text,

          // new_password: newPasswordController.text,
        ),
        token:
            "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}");
    response.when(success: (response) {
      emit(ResetPasswordState.success(response));
    }, failure: (error) {
      emit(ResetPasswordState.error(error));
    });
  }
}
