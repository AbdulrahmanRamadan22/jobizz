import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jobizz/features/auth/change_password/data/repo/change_password_repo.dart';
import 'package:jobizz/features/companies/data/repo/company_info_repo.dart';
import 'package:jobizz/features/home/data/repo/home_repo.dart';

import '../../features/auth/forget_password_screen/data/repo/forget_pass.dart';
import '../../features/auth/login/data/repo/login_repo.dart';
import '../../features/auth/otp_screen/data/repo/otp_repo.dart';
import '../../features/auth/register/data/repo/sign_up_repo.dart';
import '../../features/auth/reset_password_screen/data/repo/reset_password_repo.dart';
import '../../features/category/data/repo/category_repo.dart';
import '../networking/api_factory.dart';
import '../networking/api_services.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // dio and ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApisServices>(() => ApisServices(dio));

  // sign up
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  // // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // // forget password
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt()));
  // // otp
  getIt.registerLazySingleton<OtpRepo>(() => OtpRepo(getIt()));

  getIt.registerLazySingleton<ResetPasswordRepo>(
      () => ResetPasswordRepo(getIt()));
  // // change password
  getIt.registerLazySingleton<ChangePasswordRepo>(
      () => ChangePasswordRepo(getIt()));

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));


  // company info
  getIt.registerLazySingleton<CompanyInfoRepo>(() => CompanyInfoRepo(getIt()));

  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));

  // // reset password

  // // company info
  // getIt.registerLazySingleton<CompanyInfoRepo>(() => CompanyInfoRepo(getIt()));
}
