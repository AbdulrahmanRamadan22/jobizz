// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/cache/constants.dart';
import 'package:jobizz/core/cache/shared_pref.dart';
import 'package:jobizz/features/home/data/model/home_response_model.dart';

import 'package:jobizz/features/saved_jobs/cubit/saved_state.dart';
import 'package:jobizz/features/saved_jobs/data/repo/repo_saved.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit(
    this._repoSaved,
  ) : super(SavedState.initial());
  final RepoSaved _repoSaved;
  Map<int, bool> savedJobsMap = {};

  void changeSavedJobs(int id) async {
    savedJobsMap[id] = !(savedJobsMap[id] ?? false);
    emit(SavedState.savedLoading());
    final response = await _repoSaved.savedJobs(
      itemId: id,
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
    );
    response.when(
      success: (savedJobsData) {
        savedJobsMap[id] = !(savedJobsMap[id] ?? false);

        emit(SavedState.savedSuccess(savedJobsData));
      },
      failure: (error) {
        emit(SavedState.savedFailure(error));
      },
    );
  }

  void initSavedJob(Jop job) {
    if (!savedJobsMap.containsKey(job.id)) {
      savedJobsMap[job.id] = job.isFavorite;
    }
  }

  // get saved jobs
  void getSavedJobs() async {
    emit(SavedState.savedLoading());
    final response = await _repoSaved.getSavedJobs(
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
      profileId: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
    );
    response.when(
      success: (savedJobsData) {
        emit(SavedState.savedSuccess(savedJobsData));
      },
      failure: (error) {
        emit(SavedState.savedFailure(error));
      },
    );
  }
}
