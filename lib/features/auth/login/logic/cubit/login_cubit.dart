import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/cache/constants.dart';
import '../../../../../core/cache/shared_pref.dart';
import '../../../../../core/networking/api_error_model.dart';
import '../../data/model/login_request.dart';
import '../../data/model/login_response.dart';
import '../../data/repo/login_repo.dart';
import 'login_state.dart';

// final String clientId =
//     '632531925884-l0j2oh7n00v4idratqh5b6s9dtuhrr36.apps.googleusercontent.com';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId:
        '632531925884-l0j2oh7n00v4idratqh5b6s9dtuhrr36.apps.googleusercontent.com',
  );

  void emitLogin() async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    ));

    response.when(
      success: (loginResponse) async {
        await _saveUserData(loginResponse);

        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(
          LoginState.failure(
            ApiErrorModel(message: error.message),
          ),
        );
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(const LoginState.googleAuthenticationLoading());
    try {
      //await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      await _googleSignIn.signInSilently();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        emit(LoginState.googleAuthenticationFailure(ApiErrorModel()));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // debugPrint(
      //   'Google ID Token: ${googleAuth.idToken}#############',
      // );

      if (googleAuth.idToken == null) {
        emit(
          LoginState.googleAuthenticationFailure(
            ApiErrorModel(message: 'Google ID Token is null'),
          ),
        );

        return;
      }

      final response = await _loginRepo.googleAuth(data: {
        'token': googleAuth.idToken,
        // 'clientId': clientId,
      });

      response.when(
        success: (loginResponse) async {
          await _saveUserData(loginResponse);
          emit(LoginState.googleAuthenticationSuccess(loginResponse));
        },
        failure: (error) {
          emit(LoginState.googleAuthenticationFailure(
            ApiErrorModel(message: error.message),
          ));
        },
      );
    } catch (error) {
      debugPrint('Google sign-in error: $error');
      emit(LoginState.googleAuthenticationFailure(
        ApiErrorModel(
          message: ' $error',
        ),
      ));
    }
  }

  Future<void> _saveUserData(LoginResponse loginResponse) async {
    try {
      await SharedPrefHelper.saveSecuredString(
        key: SharedPrefKeys.token,
        value: loginResponse.data.token,
      );
      await SharedPrefHelper.saveData(
        key: SharedPrefKeys.email,
        value: loginResponse.data.email,
      );
      await SharedPrefHelper.saveData(
        key: SharedPrefKeys.fullName,
        value: loginResponse.data.fullName,
      );
      await handelSaveProfileId(loginResponse);
      //  SharedPrefHelper.isLoggedIn();
      SharedPrefValues.token = loginResponse.data.token;
      SharedPrefValues.fullName = loginResponse.data.fullName;
    } catch (e) {
      log('Error saving user data: $e');
    }
  }

/*************  ✨ Windsurf Command ⭐  *************/
  /// Saves the profile ID to shared preferences based on the login response.
  ///
  /// If there is only one profile in the login response or no profile ID is
  /// currently stored, it saves the first profile's ID. Otherwise, it retains
  /// the existing profile ID.
  ///
  /// This ensures that the user's selected profile is correctly maintained
  /// across sessions.

  Future<void> handelSaveProfileId(LoginResponse loginResponse) async {
    // Check if there is only one profile or if no profile ID is currently stored
    if (loginResponse.data.profiles.length == 1 ||
        SharedPrefHelper.getData(key: SharedPrefKeys.idProfile) == null) {
      // Save the first profile's ID
      await SharedPrefHelper.saveData(
        key: SharedPrefKeys.idProfile,
        value: loginResponse.data.profiles.first?.id,
      );
    } else {
      // Retain the existing profile ID
      await SharedPrefHelper.saveData(
        key: SharedPrefKeys.idProfile,
        value: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      );
    }
  }
}
