import 'package:bloc/bloc.dart';
import 'package:jobizz/features/switch_profile/logic/switch_profile_state.dart';

import '../../../core/cache/constants.dart';
import '../../../core/cache/shared_pref.dart';
import '../../profile/data/function/save_profile_cache.dart';
import '../data/repo/profiles_repo.dart';

class SwitchProfileCubit extends Cubit<SwitchProfileState> {
  SwitchProfileCubit(this._switchProfilesRepo) : super(SwitchProfileState.initial());

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
        emit(SwitchProfileState.getProfilesSuccess(homeResponse));
      },
      failure: (error) {
        emit(SwitchProfileState.getProfilesFailure(error));
      },
    );
  }

  void emitGetProfileByIdDetails({required int id}) async {
    emit(const SwitchProfileState.profileDetailsByIdLoading());

    final response = await _switchProfilesRepo.getProfileDetailsById(
      id: id,
      token: "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (profileResponse)async {

        await saveProfile(profileResponse);
        emit(SwitchProfileState.profileDetailsByIdSuccess(profileResponse));
      //  await SharedPrefHelper.saveData(key: SharedPrefKeys.idProfile, value: id);

      },
      failure: (error) {
        emit(SwitchProfileState.profileDetailsByIdFailure(error));
      },
    );
  }




}



