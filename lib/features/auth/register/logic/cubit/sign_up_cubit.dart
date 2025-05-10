// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobizz/features/auth/register/logic/cubit/sign_up_state.dart';

import '../../../../../core/networking/api_error_model.dart';
import '../../data/model/sign_up_request.dart';
import '../../data/repo/sign_up_repo.dart';


class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId:
        '632531925884-l0j2oh7n00v4idratqh5b6s9dtuhrr36.apps.googleusercontent.com',
  );

  void emitSignUp() async {
    emit(const SignUpState.loading());
    final response = await _signUpRepo.signUp(SignUpRequest(
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: passwordController.text,
      fullName: fullNameController.text,
    ));
    response.when(
      success: (signUpResponse) {
        emit(SignUpState.success(signUpResponse));
      },
      failure: (error) {
        emit(SignUpState.failure(error));
      },
    );
  }

  //ToDO: add google auth
  Future<void> signUpWithGoogle() async {
    emit(const SignUpState.googleAuthenticationLoading());
    try {
      // await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      await _googleSignIn.signInSilently();
      await _googleSignIn.signIn();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        emit(SignUpState.googleAuthenticationFailure(
            ApiErrorModel(message: 'Google sign-up aborted by user')));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      debugPrint('Google ID Token: ${googleAuth.idToken}');

      if (googleAuth.idToken == null) {
        emit(SignUpState.googleAuthenticationFailure(
          ApiErrorModel(message: 'No ID token received from Google'),
        ));
        return;
      }

      final response = await _signUpRepo.googleAuth(data: {
        'token': googleAuth.idToken,
      });

      response.when(
        success: (registerResponse) async {
          await _saveUserData(registerResponse);
          emit(SignUpState.googleAuthenticationSuccess(registerResponse));
        },
        failure: (error) {
          emit(SignUpState.googleAuthenticationFailure(error));
        },
      );
    } catch (error) {
      debugPrint('Google sign-up error: $error');
      emit(SignUpState.googleAuthenticationFailure(
        ApiErrorModel(message: '$error'),
      ));
    }
  }

  Future<void> _saveUserData(dynamic userData) async {
    // Implement your logic to save user data here
    debugPrint('User data saved: $userData');
  }
}
