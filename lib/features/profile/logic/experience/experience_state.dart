import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobizz/features/profile/data/models/profile_response_model.dart';

import '../../../../core/networking/api_error_model.dart';

part 'experience_state.freezed.dart';

@freezed
abstract class ExperienceState<T> with _$ExperienceState<T> {
  const factory ExperienceState.initial() = _Initial;

  // experience

  const factory ExperienceState.updateExperienceSuccess() =
      UpdateExperienceSuccess;

  const factory ExperienceState.updateExperienceFailure(
      ApiErrorModel apiErrorModel) = UpdateExperienceFailure;

  const factory ExperienceState.updateExperienceLoading() =
      UpdateExperienceLoading;

  const factory ExperienceState.addExperienceSuccess() = AddExperienceSuccess;

  const factory ExperienceState.addExperienceFailure(
      ApiErrorModel apiErrorModel) = AddExperienceFailure;

  const factory ExperienceState.addExperienceLoading() = AddExperienceLoading;

  const factory ExperienceState.deleteExperienceSuccess() =
      DeleteExperienceSuccess;

  const factory ExperienceState.deleteExperienceFailure(
      ApiErrorModel apiErrorModel) = DeleteExperienceFailure;

  const factory ExperienceState.deleteExperienceLoading() =
      DeleteExperienceLoading;

  const factory ExperienceState.getAllExperiencesLoading() =
      GetAllExperiencesLoading;

  const factory ExperienceState.getAllExperiencesSuccess(
      List<Experience> experiences) = GetAllExperiencesSuccess;

  const factory ExperienceState.getAllExperiencesFailure(
      ApiErrorModel apiErrorModel) = GetAllExperiencesFailure;
}