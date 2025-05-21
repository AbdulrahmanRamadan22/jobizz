

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobizz/features/switch_profile/data/models/profile_response_model.dart';

import '../../../core/networking/api_error_model.dart';

part  'switch_profile_state.freezed.dart';

@freezed
class SwitchProfileState<T> with _$SwitchProfileState<T> {
  const factory SwitchProfileState.initial() = _Initial;

    const factory SwitchProfileState.getProfilesDetailsSuccess(ProfilesResponseModel profilesResponseModel) = GetProfilesDetailsSuccess;

  const factory SwitchProfileState.getProfileDetailsFailure(ApiErrorModel apiErrorModel) = GetProfilesDetailsFailure;

  const factory SwitchProfileState.getProfilesDetailsLoading() = GetProfilesDetailsLoading;

}




