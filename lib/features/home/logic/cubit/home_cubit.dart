import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/cache/shared_pref.dart';
import 'package:jobizz/features/home/data/repo/home_repo.dart';

import '../../../../core/cache/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

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
        emit(HomeState.success(homeResponse));
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
