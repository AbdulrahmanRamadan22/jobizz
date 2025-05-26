
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:jobizz/features/profile/logic/profile_state.dart';

import '../../../core/cache/constants.dart';
import '../../../core/cache/shared_pref.dart';
import '../data/function/save_profile_cache.dart';
import '../data/repo/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileState.initial());

  final ProfileRepo _profileRepo;

  void emitGetProfileDetails() async {
    emit(const ProfileState.profileDetailsLoading());

    final response = await _profileRepo.getProfileDetails(
      id: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (profileResponse) async {

        log(profileResponse.toString());
        await saveProfile(profileResponse);
        emit(ProfileState.profileDetailsSuccess(profileResponse));
        //  await SharedPrefHelper.saveData(key: SharedPrefKeys.idProfile, value: id);
      },
      failure: (error) {
        emit(ProfileState.profileDetailsFailure(error));
      },
    );
  }
}
