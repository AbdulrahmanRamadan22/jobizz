import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/home/data/repo/home_repo.dart';

import '../../../../core/cache/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());


  void emitGetHomeData() async {
    emit(const HomeState.loading());

    final response = await _homeRepo.getHomeData(
      token: "Bearer ${SharedPrefValues.token}",
    );
    response.when(
      success: (homeResponse) {
        emit(HomeState.success(homeResponse));
      },
      failure: (error) {
        emit(HomeState.failure(error));
      },
    );
  }
}
