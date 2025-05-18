import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobizz/core/networking/api_error_model.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';

part 'company_state.freezed.dart';

@freezed
class CompanyState<T> with _$CompanyState<T> {
  const factory CompanyState.initial() = _Initial;

  const factory CompanyState.companyLoading() = CompanyLoading;
  const factory CompanyState.companySuccess(CompanyResponse companyResponse) =
      CompanySuccess;
  const factory CompanyState.companyError(ApiErrorModel apiErrorModel) =
      CompanyError;
}
