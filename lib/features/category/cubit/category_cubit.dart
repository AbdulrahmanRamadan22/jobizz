import 'package:bloc/bloc.dart';
import 'package:jobizz/features/category/cubit/category_state.dart';

import '../../../core/cache/constants.dart';
import '../../../core/cache/shared_pref.dart';
import '../data/repo/category_repo.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(const CategoryState.initial());
  CategoryRepo categoryRepo;

  bool isFirstLoad = false;
  void getAllCategories() async {
    if (isFirstLoad) return;
    emit(CategoryState.categoryLoading());
    final response = await categoryRepo.getCategories(
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (data) {
        isFirstLoad = true;
        emit(CategoryState.categorySuccess(data));
      },
      failure: (error) {
        emit(CategoryState.categoryFailure(error));
      },
    );
  }
}
