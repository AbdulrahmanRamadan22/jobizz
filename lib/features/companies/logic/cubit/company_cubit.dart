import 'package:bloc/bloc.dart';
import 'package:jobizz/core/cache/constants.dart';
import 'package:jobizz/features/companies/data/repo/company_info_repo.dart';
import 'package:jobizz/features/companies/logic/cubit/company_state.dart';

import '../../../../core/cache/shared_pref.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(this.companyInfoRepo) : super(const CompanyState.initial());
  CompanyInfoRepo companyInfoRepo;

    bool isFirstLoad = false;

  void getAllCompany() async {
    if (isFirstLoad) return;
    emit(const CompanyState.companyLoading());
    final response = await companyInfoRepo.getCompanyInfo(
      token:
          "Bearer ${await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token)}",
    );
    response.when(
      success: (data) {
        isFirstLoad=true;
        emit(CompanyState.companySuccess(data));
      },
      failure: (error) {
        emit(CompanyState.companyError(error));
      },
    );
  }
}
