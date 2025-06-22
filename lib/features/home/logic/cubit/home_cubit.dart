import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/cache/shared_pref.dart';
import 'package:jobizz/features/home/data/model/home_response_model.dart';
import 'package:jobizz/features/home/data/repo/home_repo.dart';

import '../../../../core/cache/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  // List of All jobs
  List<Jop?>? allJobsList = [];
  // is Saved Jobs
  Map<int, bool> savedJobsMap = {};

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  bool isFirstLoad = false;

  void emitGetHomeData() async {
    if (isFirstLoad) return;
    emit(const HomeState.loading());

    final response = await _homeRepo.getHomeData(
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (homeResponse) {
        isFirstLoad = true;
        allJobsList = [
          ...homeResponse.data?.popular ?? [],
          ...homeResponse.data?.recommended ?? [],
          ...homeResponse.data?.trending ?? [],
        ];

        allJobsList?.forEach((element) {
          savedJobsMap.addAll(
            {
              element!.id: element.isFavorite,
            },
          );
        });
        emit(HomeState.success(homeResponse));
        print("Saved Jobs: $savedJobsMap");
      },
      failure: (error) {
        emit(HomeState.failure(error));
      },
    );
  }

  void emitRefreshGetHomeData() async {
    emit(const HomeState.loading());
    isFirstLoad = false;

    emitGetHomeData();
  }
}
