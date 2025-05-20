import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobizz/features/home/data/model/home_response_model.dart';
import 'package:jobizz/features/profile/data/models/profile_response_model.dart';

import '../../../../../core/networking/api_error_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success(HomeResponseModel homeResponseModel) = Success<T>;
  const factory HomeState.failure(ApiErrorModel apiErrorModel) = Error;


  const factory HomeState.getProfileDetailsSuccess(ProfileResponseModel profileResponseModel) = GetProfileDetailsSuccess<T>;

  const factory HomeState.getProfileDetailsFailure(ApiErrorModel apiErrorModel) = GetProfileDetailsError;

  const factory HomeState.getProfileDetailsLoading() = GetProfileDetailsLoading;


}
