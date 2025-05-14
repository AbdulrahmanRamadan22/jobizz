import 'package:bloc/bloc.dart';

import '../../../../core/cache/constants.dart';
import '../../data/repo/company_info_repo.dart';
import 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(this.companyInfoRepo) : super(const CompanyState.initial());
  CompanyInfoRepo companyInfoRepo;
  void getAllCompany() async {
    emit(const CompanyState.companyLoading());
    final response = await companyInfoRepo.getCompanyInfo(
      token: 'Bearer ${SharedPrefValues.token}',
    );
    response.when(
      success: (data) {
        emit(CompanyState.companySuccess(data));
      },
      failure: (error) {
        emit(CompanyState.companyError(error));
      },
    );
  }
}
