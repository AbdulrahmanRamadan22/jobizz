import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:jobizz/features/profile/logic/experience/experience_state.dart';

import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../../data/models/experience_request_model.dart';
import '../../data/repos/experience_repo.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  ExperienceCubit(this._experienceRepo) : super(ExperienceState.initial());

  final ExperienceRepo _experienceRepo;

  bool firstLoadedExperiences = false;

  // Add method to refresh data when needed
  void refreshExperiences() {
    firstLoadedExperiences = false;
    getAllExperiences();

    log("firstLoadedExperiences: $firstLoadedExperiences");
  }

  void updateExperience({
    required int experienceId,
    required ExperienceRequestModel experienceRequestModel,
  }) async {
    emit(const ExperienceState.updateExperienceLoading());

    final response = await _experienceRepo.updateExperience(
      experienceId: experienceId,
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
      experienceRequestModel: experienceRequestModel,
    );
    response.when(
      success: (profileResponse) async {
        refreshExperiences();
        emit(ExperienceState.updateExperienceSuccess());
      },
      failure: (error) {
        emit(ExperienceState.updateExperienceFailure(error));
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  final companyController = TextEditingController();
  final positionController = TextEditingController();
  final locationController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final descriptionController = TextEditingController();

  // Current job checkbox state
  bool isCurrentJob = false;

  void setCurrentJob(bool value) {
    isCurrentJob = value;
    if (value) {
      endDateController.clear();
    }
  }

  void resetForm() {
    companyController.clear();
    positionController.clear();
    locationController.clear();
    startDateController.clear();
    endDateController.clear();
    descriptionController.clear();
  }

  void addExperience() async {
    emit(const ExperienceState.addExperienceLoading());

    final response = await _experienceRepo.addExperience(
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
      experienceRequestModel: ExperienceRequestModel(
        company: companyController.text,
        position: positionController.text,
        startDate: startDateController.text,
        endDate: isCurrentJob ? null : endDateController.text,
        isCurrent: endDateController.text.isEmpty ? true : false,
        location: locationController.text,
        description: descriptionController.text,
      ),
    );
    response.when(
      success: (profileResponse) async {
        resetForm();
        refreshExperiences();
        emit(ExperienceState.addExperienceSuccess());
      },
      failure: (error) {
        emit(ExperienceState.addExperienceFailure(error));
      },
    );
  }

  void getAllExperiences() async {
    if (firstLoadedExperiences) return;
    emit(const ExperienceState.getAllExperiencesLoading());

    final response = await _experienceRepo.getAllExperiences(
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (profileResponse) async {
        firstLoadedExperiences = true;
        emit(ExperienceState.getAllExperiencesSuccess(
            profileResponse.data?.experiences ?? []));
      },
      failure: (error) {
        emit(ExperienceState.getAllExperiencesFailure(error));
      },
    );
  }

  void deleteExperience({
    required int experienceId,
    int? profileId,
  }) async {
    emit(const ExperienceState.deleteExperienceLoading());

    final response = await _experienceRepo.deleteExperience(
      experienceId: experienceId,
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (profileResponse) async {
        refreshExperiences();
        emit(ExperienceState.deleteExperienceSuccess());
      },
      failure: (error) {
        emit(ExperienceState.deleteExperienceFailure(error));
      },
    );
  }
}
