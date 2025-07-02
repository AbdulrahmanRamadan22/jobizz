import 'package:bloc/bloc.dart';

import 'package:jobizz/features/profile/logic/resume/resume_state.dart';

import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../../data/repos/resume_repo.dart';

class ResumeCubit extends Cubit<ResumeState> {
  ResumeCubit(this._resumeRepo) : super(ResumeState.initial());

  final ResumeRepo _resumeRepo;

  bool firstLoadedResumes = false;

  // Add method to refresh data when needed
  void refreshResumes() {
    firstLoadedResumes = false;
    getAllResume();

    // log("firstLoadedExperiences: $firstLoadedExperiences");
  }

  // void updateExperience({
  //   required int experienceId,
  //   required ExperienceRequestModel experienceRequestModel,
  // }) async {
  //   emit(const ExperienceState.updateExperienceLoading());

  //   final response = await _experienceRepo.updateExperience(
  //     experienceId: experienceId,
  //     profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
  //     token:
  //         "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
  //     experienceRequestModel: experienceRequestModel,
  //   );
  //   response.when(
  //     success: (profileResponse) async {
  //       refreshExperiences();
  //       emit(ExperienceState.updateExperienceSuccess());
  //     },
  //     failure: (error) {
  //       emit(ExperienceState.updateExperienceFailure(error));
  //     },
  //   );
  // }

  // final formKey = GlobalKey<FormState>();
  // final companyController = TextEditingController();
  // final positionController = TextEditingController();
  // final locationController = TextEditingController();
  // final startDateController = TextEditingController();
  // final endDateController = TextEditingController();
  // final descriptionController = TextEditingController();

  // // Current job checkbox state
  // bool isCurrentJob = false;

  // void setCurrentJob(bool value) {
  //   isCurrentJob = value;
  //   if (value) {
  //     endDateController.clear();
  //   }
  // }

  // void resetForm() {
  //   companyController.clear();
  //   positionController.clear();
  //   locationController.clear();
  //   startDateController.clear();
  //   endDateController.clear();
  //   descriptionController.clear();
  // }

  // void addExperience() async {
  //   emit(const ExperienceState.addExperienceLoading());

  //   final response = await _experienceRepo.addExperience(
  //     profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
  //     token:
  //         "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
  //     experienceRequestModel: ExperienceRequestModel(
  //       company: companyController.text,
  //       position: positionController.text,
  //       startDate: startDateController.text,
  //       endDate: isCurrentJob ? null : endDateController.text,
  //       isCurrent: endDateController.text.isEmpty ? true : false,
  //       location: locationController.text,
  //       description: descriptionController.text,
  //     ),
  //   );
  //   response.when(
  //     success: (profileResponse) async {
  //       resetForm();
  //       refreshExperiences();
  //       emit(ExperienceState.addExperienceSuccess());
  //     },
  //     failure: (error) {
  //       emit(ExperienceState.addExperienceFailure(error));
  //     },
  //   );
  // }

  void getAllResume() async {
    if (firstLoadedResumes) return;
    emit(const ResumeState.getAllResumesLoading());

    final response = await _resumeRepo.getAllResume(
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (profileResponse) async {
        firstLoadedResumes = true;
        emit(ResumeState.getAllResumesSuccess(profileResponse.data?.cvs ?? []));
      },
      failure: (error) {
        emit(ResumeState.getAllResumesFailure(error));
      },
    );
  }

  void addApplication({required int jobId, required int cvId}) async {
    emit(const ResumeState.addResumeLoading());

    final response = await _resumeRepo.addApplication(
        jobId: jobId,
        profileId:
            await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
        token:
            "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
        data: {
          "cv_id": cvId,
        });
    response.when(
      success: (profileResponse) async {
        emit(ResumeState.addResumeSuccess());
      },
      failure: (error) {
        emit(ResumeState.addResumeFailure(error));
      },
    );
  }

  // void deleteExperience({
  //   required int experienceId,
  //   int? profileId,
  // }) async {
  //   emit(const ExperienceState.deleteExperienceLoading());

  //   final response = await _experienceRepo.deleteExperience(
  //     experienceId: experienceId,
  //     profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
  //     token:
  //         "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
  //   );
  //   response.when(
  //     success: (profileResponse) async {
  //       refreshExperiences();
  //       emit(ExperienceState.deleteExperienceSuccess());
  //     },
  //     failure: (error) {
  //       emit(ExperienceState.deleteExperienceFailure(error));
  //     },
  //   );
  // }
}
