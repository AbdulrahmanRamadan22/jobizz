

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../data/models/profile_response_model.dart';

part  'profile_state.freezed.dart';

@freezed
abstract class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;

  
  const factory ProfileState.profileDetailsSuccess(ProfileResponseModel profileResponseModel) = ProfileDetailsSuccess;

  const factory ProfileState.profileDetailsFailure(ApiErrorModel apiErrorModel) = ProfileDetailsFailure;

  const factory ProfileState.profileDetailsLoading() = ProfileDetailsLoading;


}












