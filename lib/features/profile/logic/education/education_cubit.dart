import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/features/profile/logic/education/education_state.dart';

import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../../data/models/education_request_model.dart';
import '../../data/repos/education_repo.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit(this._educationRepo) : super(EducationState.initial());

  final EducationRepo _educationRepo;

  // bool firstLoadedData = false;

  bool firstLoadedEducations = false;

  // Add method to refresh data when needed
  void refreshEducations() {
    firstLoadedEducations = false;
    // _cachedEducations = null;
    getAllEducations();

    log("firstLoadedEducations: $firstLoadedEducations");
  }

  void updateEducation({
    required int educationId,
    required EducationRequestModel educationRequestModel,
  }) async {
    emit(const EducationState.updateEducationLoading());

    final response = await _educationRepo.updateEducation(
      educationId: educationId,
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
      educationRequestModel: educationRequestModel,
    );
    response.when(
      success: (profileResponse) async {
        // await saveProfile(profileResponse);
        refreshEducations();
        emit(EducationState.updateEducationSuccess());
      },
      failure: (error) {
        emit(EducationState.updateEducationFailure(error));
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  final schoolController = TextEditingController();
  final fieldOfStudyController = TextEditingController();
  // final collegeController = TextEditingController();
  final degreeController = TextEditingController();
  final locationController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final descriptionController = TextEditingController();

  void resetForm() {
    schoolController.clear();
    fieldOfStudyController.clear();
    // collegeController.clear();
    degreeController.clear();
    locationController.clear();
    startDateController.clear();
    endDateController.clear();
    descriptionController.clear();
  }

  void addEducation() async {
    emit(const EducationState.addEducationLoading());

    final response = await _educationRepo.addEducation(
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
      educationRequestModel: EducationRequestModel(
        isCurrent: endDateController.text.isEmpty ? true : false,
        college: schoolController.text,
        degree: degreeController.text,
        fieldOfStudy: fieldOfStudyController.text,
        startDate: startDateController.text,
        endDate: endDateController.text,
        location: locationController.text,
        description: descriptionController.text,
      ),
    );
    response.when(
      success: (profileResponse) async {
        // await saveProfile(profileResponse);
        // resetProfileData();
        resetForm();
        refreshEducations();

        emit(EducationState.addEducationSuccess());
      },
      failure: (error) {
        emit(EducationState.addEducationFailure(error));
      },
    );
  }

  void getAllEducations() async {
    if (firstLoadedEducations) return;
    emit(const EducationState.getAllEducationsLoading());

    final response = await _educationRepo.getAllEductions(
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (profileResponse) async {
        firstLoadedEducations = true;
        emit(EducationState.getAllEducationsSuccess(
            profileResponse.data?.educations ?? []));
      },
      failure: (error) {
        emit(EducationState.getAllEducationsFailure(error));
      },
    );
  }

  void deleteEducation({
    required int educationId,
    int? profileId,
  }) async {
    emit(const EducationState.deleteEducationLoading());

    final response = await _educationRepo.deleteEducation(
      educationId: educationId,
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (profileResponse) async {
        // await saveProfile(profileResponse);
        refreshEducations();
        emit(EducationState.deleteEducationSuccess());
      },
      failure: (error) {
        emit(EducationState.deleteEducationFailure(error));
      },
    );
  }
}
