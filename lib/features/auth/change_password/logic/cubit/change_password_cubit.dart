import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/auth/change_password/logic/cubit/change_password_state.dart';

import '../../../../../core/cache/constants.dart';
import '../../data/model/change_password_request.dart';
import '../../data/repo/change_password_repo.dart';


class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepo _changePasswordRepo;
  ChangePasswordCubit(this._changePasswordRepo)
      : super(const ChangePasswordState.initial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmation = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> emitChangePassword() async {
    emit(ChangePasswordState.changePasswordLoading());
    final response = await _changePasswordRepo.changePassword(
      "Bearer ${SharedPrefValues.token}",
      ChangePasswordRequest(
        oldPassword: oldPasswordController.text.trim(),
        newPassword: newPasswordConfirmation.text.trim(),
        newPasswordConfirmation: confirmPasswordController.text.trim(),
      ),
    );
    response.when(success: (response) {
      emit(ChangePasswordState.changePasswordSuccess(response));
      clearControllers();
    }, failure: (error) {
      emit(ChangePasswordState.changePasswordFailure(error));
    });
  }

  @override
  Future<void> close() {
    oldPasswordController.dispose();
    newPasswordConfirmation.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void clearControllers() {
    oldPasswordController.clear();
    newPasswordConfirmation.clear();
    confirmPasswordController.clear();
  }

}
