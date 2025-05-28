

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobizz/features/switch_profile/data/models/profile_response_model.dart';

import '../../../core/networking/api_error_model.dart';
import '../../profile/data/models/profile_response_model.dart';

part  'switch_profile_state.freezed.dart';

@freezed
class SwitchProfileState<T> with _$SwitchProfileState<T> {
  const factory SwitchProfileState.initial() = _Initial;

    const factory SwitchProfileState.getProfilesSuccess(ProfilesResponseModel profilesResponseModel) = GetProfilesSuccess;

  const factory SwitchProfileState.getProfilesFailure(ApiErrorModel apiErrorModel) = GetProfilesFailure;

  const factory SwitchProfileState.getProfilesLoading() = GetProfilesLoading;




  const factory SwitchProfileState.profileDetailsByIdSuccess(ProfileResponseModel profileResponseModel) = ProfileDetailsByIdSuccess;

  const factory SwitchProfileState.profileDetailsByIdFailure(ApiErrorModel apiErrorModel) = ProfileDetailsByIdFailure;

  const factory SwitchProfileState.profileDetailsByIdLoading() = ProfileDetailsByIdLoading;


}




