import 'package:bloc/bloc.dart';
import 'package:jobizz/core/cache/constants.dart';
import 'package:jobizz/features/companies/data/repo/company_info_repo.dart';
import 'package:jobizz/features/companies/logic/cubit/company_state.dart';

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
