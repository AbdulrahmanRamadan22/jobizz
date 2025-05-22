import 'package:bloc/bloc.dart';
import 'package:jobizz/features/switch_profile/logic/switch_profile_state.dart';

import '../../../core/cache/constants.dart';
import '../../../core/cache/shared_pref.dart';
import '../../profile/data/models/profile_response_model.dart';
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

  void emitGetProfileByIdDetails({required int id}) async {
    emit(const SwitchProfileState.profileDetailsByIdLoading());

    final response = await _profilesRepo.getProfileDetailsById(
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




  Future<void> saveProfile(ProfileResponseModel profileResponse) async {
   
      await SharedPrefHelper.saveData(
        key: SharedPrefKeys.idProfile,
        value: profileResponse.data.id,
      );
    
      await SharedPrefHelper.saveData(
        key: SharedPrefKeys.profileImage,
        value: profileResponse.data.profileImage,
      );

       await SharedPrefHelper.saveData(
        key: SharedPrefKeys.titleJob,
        value: profileResponse.data.titleJob,
      );

    }







}
