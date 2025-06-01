import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/features/profile/logic/profile_state.dart';

import '../../../core/cache/constants.dart';
import '../../../core/cache/shared_pref.dart';
import '../data/function/save_profile_cache.dart';
import '../data/models/profile_response_model.dart';
import '../data/repo/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileState.initial());

  final ProfileRepo _profileRepo;

  bool firstLoadedData = false;

  var formKey = GlobalKey<FormState>();
  TextEditingController titleJobController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController jobPositionController = TextEditingController();

  void initControllers(ProfileData? profileData) {
    if (fullNameController.text.isEmpty) {
      fullNameController.text = profileData?.fullName ?? '';
    }
    if (titleJobController.text.isEmpty) {
      titleJobController.text = profileData?.titleJob ?? '';
    }
    if (jobPositionController.text.isEmpty) {
      jobPositionController.text = profileData?.jobPosition ?? '';
    }
  }

  void resetProfileData() async {
    firstLoadedData = false;
    emitGetProfileDetails();
  }

  void emitGetProfileDetails() async {
    if (firstLoadedData) return;
    emit(const ProfileState.profileDetailsLoading());

    final response = await _profileRepo.getProfileDetails(
      id: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (profileResponse) async {
        firstLoadedData = true;
        await saveProfile(profileResponse);
        emit(ProfileState.profileDetailsSuccess(profileResponse));
        //  await SharedPrefHelper.saveData(key: SharedPrefKeys.idProfile, value: id);
      },
      failure: (error) {
        emit(ProfileState.profileDetailsFailure(error));
      },
    );
  }

  void updateGeneralProfileData() async {
    emit(const ProfileState.updateGeneralProfileDataLoading());

    final response = await _profileRepo.updateGeneralProfileData(
      id: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
      data: {
        "title_job": titleJobController.text.trim(),
        "full_name": fullNameController.text.trim(),
        "job_position": jobPositionController.text.trim(),
        "is_default": "1"
      },
    );
    response.when(
      success: (profileResponse) async {
        //  emit(ProfileState.profileDetailsSuccess(profileResponse));

        // await saveProfile(profileResponse);
        emit(ProfileState.updateGeneralProfileDataSuccess(profileResponse));
        //  await SharedPrefHelper.saveData(key: SharedPrefKeys.idProfile, value: id);
      },
      failure: (error) {
        emit(ProfileState.updateGeneralProfileDataFailure(error));
      },
    );
  }
}
