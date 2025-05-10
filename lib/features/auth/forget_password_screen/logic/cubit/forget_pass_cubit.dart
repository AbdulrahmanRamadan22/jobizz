import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/forget_pass_request.dart';
import '../../data/repo/forget_pass.dart';
import 'forget_pass_state.dart';


class ForgetPassCubit extends Cubit<ForgetPassState> {
  final ForgetPasswordRepo _forgetPasswordRepo;
  ForgetPassCubit(this._forgetPasswordRepo)
      : super(const ForgetPassState.initial());
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  void emitForgetPassword() async {
    emit(const ForgetPassState.loading());
    final response =
        await _forgetPasswordRepo.forgetPassword(ForgetPassRequest(
      email: emailController.text,
    ));
    response.when(
      success: (forgetPassResponse) {
        emit(ForgetPassState.success(forgetPassResponse, emailController.text));
      },
      failure: (error) {
        emit(ForgetPassState.failure(error));
      },
    );
  }
}
