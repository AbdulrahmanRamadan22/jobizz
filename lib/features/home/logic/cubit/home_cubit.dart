import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/home/data/repo/home_repo.dart';

import '../../../../core/cache/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  // saved jobs
  Map<int, bool> savedJobs = {};

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void emitGetHomeData() async {
    emit(const HomeState.loading());
   
    final response = await _homeRepo.getHomeData(
      token: "Bearer ${SharedPrefValues.token}",
    );
    response.when(
      success: (homeResponse) {
        // saved jobs
        homeResponse.data?.trending?.forEach((element) {
          if (element?.id != null) {
            savedJobs.addAll({element!.id!: false});
          }
        });
        //print(savedJobs);
        // print('hello');
        emit(HomeState.success(homeResponse));
      },
      failure: (error) {
        emit(HomeState.failure(error));
      },
    );
  }

  // void emitGetProfileDetails() async {
  //   emit(const HomeState.getProfileDetailsLoading());

  //   final response = await _homeRepo.getProfileDetails(
  //     id: await SharedPrefHelper.getData(key: SharedPrefKeys.idProfile),
  //     token: "Bearer ${SharedPrefValues.token}",
  //   );
  //   response.when(
  //     success: (profileResponse) {
  //       emit(HomeState.getProfileDetailsSuccess(profileResponse));
  //     },
  //     failure: (error) {
  //       emit(HomeState.getProfileDetailsFailure(error));
  //     },
  //   );
  // }
}
