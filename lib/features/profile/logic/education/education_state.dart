import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobizz/features/profile/data/models/profile_response_model.dart';

import '../../../../core/networking/api_error_model.dart';
// import '../data/models/education_response_model.dart';
import '../../data/models/education_response_model.dart';

part 'education_state.freezed.dart';

@freezed
abstract class EducationState<T> with _$EducationState<T> {
  const factory EducationState.initial() = _Initial;

  // education

  const factory EducationState.updateEducationSuccess() =
      UpdateEducationSuccess;

  const factory EducationState.updateEducationFailure(
      ApiErrorModel apiErrorModel) = UpdateEducationFailure;

  const factory EducationState.updateEducationLoading() =
      UpdateEducationLoading;

  const factory EducationState.addEducationSuccess() = AddEducationSuccess;

  const factory EducationState.addEducationFailure(
      ApiErrorModel apiErrorModel) = AddEducationFailure;

  const factory EducationState.addEducationLoading() = AddEducationLoading;

  const factory EducationState.deleteEducationSuccess() =
      DeleteEducationSuccess;

  const factory EducationState.deleteEducationFailure(
      ApiErrorModel apiErrorModel) = DeleteEducationFailure;

  const factory EducationState.deleteEducationLoading() =
      DeleteEducationLoading;

  const factory EducationState.getAllEducationsLoading() =
      GetAllEducationsLoading;

  const factory EducationState.getAllEducationsSuccess(
      List<Education> educations) = GetAllEducationsSuccess;

  const factory EducationState.getAllEducationsFailure(
      ApiErrorModel apiErrorModel) = GetAllEducationsFailure;
}
