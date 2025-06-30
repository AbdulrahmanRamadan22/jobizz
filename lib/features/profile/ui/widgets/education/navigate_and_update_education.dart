import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../data/models/profile_response_model.dart';
import '../../../logic/profile/profile_cubit.dart';

void navigateAndUpdateEducation(
    BuildContext context, Education? education) async {
  final result =
      await context.pushNamed(Routes.editEducationScreen, arguments: education);
  if (result == true) {
    log("education updated successfully ");
    context.read<ProfileCubit>().resetProfileData();
  } else {
    log("education updated failed ");
  }
}
