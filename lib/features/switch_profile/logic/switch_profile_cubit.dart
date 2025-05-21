import 'package:bloc/bloc.dart';
import 'package:jobizz/features/switch_profile/logic/switch_profile_state.dart';

import '../../../core/cache/constants.dart';
import '../../../core/cache/shared_pref.dart';
import '../data/repo/profiles_repo.dart';

class SwitchProfileCubit extends Cubit<SwitchProfileState> {
  SwitchProfileCubit(this._profilesRepo) : super(SwitchProfileState.initial());

  final ProfilesRepo _profilesRepo;

  void emitGetProfilesDetailsData() async {
    emit(const SwitchProfileState.getProfilesDetailsLoading());

    final response = await _profilesRepo.getProfileDetails(
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (homeResponse) {
        emit(SwitchProfileState.getProfilesDetailsSuccess(homeResponse));
      },
      failure: (error) {
        emit(SwitchProfileState.getProfileDetailsFailure(error));
      },
    );
  }
}
