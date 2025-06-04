import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/features/profile/logic/profile_state.dart';

import '../../../core/cache/constants.dart';
import '../../../core/cache/shared_pref.dart';
import '../data/function/save_profile_cache.dart';
import '../data/repo/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileState.initial());

  final ProfileRepo _profileRepo;

  bool firstLoadedData = false;

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

  void updateGeneralProfileData({
   required String fullName,
    required String titleJob,
    String? jobPosition,
  }) async {
    emit(const ProfileState.updateGeneralProfileDataLoading());

    final response = await _profileRepo.updateGeneralProfileData(
      id: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
      data: {
        "title_job": titleJob.trim(),
        "full_name": fullName.trim(),
        "job_position": jobPosition?.trim(),
        "is_default": "1"
      },
    );
    response.when(
      success: (profileResponse) async {
        // await saveProfile(profileResponse);
        emit(ProfileState.updateGeneralProfileDataSuccess(profileResponse));
      },
      failure: (error) {
        emit(ProfileState.updateGeneralProfileDataFailure(error));
      },
    );
  }
}
