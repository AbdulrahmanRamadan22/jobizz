


import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../data/models/profile_response_model.dart';

part 'resume_state.freezed.dart';

@freezed
abstract class ResumeState<T> with _$ResumeState<T> {
  const factory ResumeState.initial() = _Initial;

  // experience

  const factory ResumeState.updateResumeSuccess() =
      UpdateResumeSuccess;

  const factory ResumeState.updateResumeFailure(ApiErrorModel apiErrorModel) =
      UpdateResumeFailure;

  const factory ResumeState.updateResumeLoading() = UpdateResumeLoading;

  const factory ResumeState.addResumeSuccess() = AddResumeSuccess;

  const factory ResumeState.addResumeFailure(ApiErrorModel apiErrorModel) =
      AddResumeFailure;

  const factory ResumeState.addResumeLoading() = AddResumeLoading;

  const factory ResumeState.deleteResumeSuccess() = DeleteResumeSuccess;

  const factory ResumeState.deleteResumeFailure(ApiErrorModel apiErrorModel) =
      DeleteResumeFailure;

  const factory ResumeState.deleteResumeLoading() = DeleteResumeLoading;

  const factory ResumeState.getAllResumesLoading() = GetAllResumesLoading;

  const factory ResumeState.getAllResumesSuccess(List<Cv> resumes) =
      GetAllResumesSuccess;

  const factory ResumeState.getAllResumesFailure(ApiErrorModel apiErrorModel) =
      GetAllResumesFailure;



  const factory ResumeState.applicationApplyLoading() = ApplicationApplyLoading;

  const factory ResumeState.applicationApplySuccess() = ApplicationApplySuccess;

  const factory ResumeState.applicationApplyFailure(ApiErrorModel apiErrorModel) =
      ApplicationApplyFailure;






 
}