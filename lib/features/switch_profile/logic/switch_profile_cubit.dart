import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/features/switch_profile/logic/switch_profile_state.dart';

import '../../../core/cache/constants.dart';
import '../../../core/cache/shared_pref.dart';
import '../../profile/data/function/save_profile_cache.dart';
import '../data/repo/profiles_repo.dart';

class SwitchProfileCubit extends Cubit<SwitchProfileState> {
  SwitchProfileCubit(this._switchProfilesRepo)
      : super(SwitchProfileState.initial());

  final SwitchProfilesRepo _switchProfilesRepo;

  bool isFirstLoad = false;
  

  void emitGetProfilesDetailsData() async {
    if (isFirstLoad) return;
    emit(const SwitchProfileState.getProfilesLoading());

    final response = await _switchProfilesRepo.getProfileDetails(
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (homeResponse) {
        isFirstLoad = true;
        debugPrint('🤞 SwitchProfileCubit: Profiles fetched successfully');
        emit(SwitchProfileState.getProfilesSuccess(homeResponse));
      },
      failure: (error) {
        debugPrint(
            '🤞 SwitchProfileCubit: Profiles fetch failed: ${error.message}');

        emit(SwitchProfileState.getProfilesFailure(error));
      },
    );
  }

  void emitGetProfileByIdDetails({required int id}) async {
    emit(const SwitchProfileState.profileDetailsByIdLoading());

    final response = await _switchProfilesRepo.getProfileDetailsById(
      id: id,
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (profileResponse) async {
        debugPrint('🤞 SwitchProfileCubit: Profile $id fetched successfully');
        await saveProfile(profileResponse);
        emit(SwitchProfileState.profileDetailsByIdSuccess(profileResponse));
        //  await SharedPrefHelper.saveData(key: SharedPrefKeys.idProfile, value: id);
      },
      failure: (error) {
        debugPrint(
            '🤞 SwitchProfileCubit: Profile fetch failed: ${error.message}');

        emit(SwitchProfileState.profileDetailsByIdFailure(error));
      },
    );
  }
}
