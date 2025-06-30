import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';
// import '../data/models/education_response_model.dart';
import '../../data/models/profile_response_model.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.profileDetailsSuccess(
      ProfileResponseModel profileResponseModel) = ProfileDetailsSuccess;

  const factory ProfileState.profileDetailsFailure(
      ApiErrorModel apiErrorModel) = ProfileDetailsFailure;

  const factory ProfileState.profileDetailsLoading() = ProfileDetailsLoading;

  const factory ProfileState.updateGeneralProfileDataSuccess(
      T profileResponseModel) = UpdateGeneralProfileDataSuccess<T>;

  const factory ProfileState.updateGeneralProfileDataFailure(
      ApiErrorModel apiErrorModel) = UpdateGeneralProfileDataFailure;

  const factory ProfileState.updateGeneralProfileDataLoading() =
      UpdateGeneralProfileDataLoading;

  const factory ProfileState.profileDetailsPortfoliosSuccess(
      List<Portfolios> portfolios) = ProfileDetailsPortfoliosSuccess;

  const factory ProfileState.profileDetailsPortfolioFailure(
      ApiErrorModel apiErrorModel) = ProfileDetailsPortfolioFailure;

  const factory ProfileState.profileDetailPortfoliosLoading() =
      ProfileDetailPortfoliosLoading;

 
}
