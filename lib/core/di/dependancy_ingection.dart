
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/forget_password_screen/data/repo/forget_pass.dart';
import '../../features/auth/login/data/repo/login_repo.dart';
import '../../features/auth/register/data/repo/sign_up_repo.dart';
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
  // // change password
  // getIt.registerLazySingleton<ChangePasswordRepo>(
  //     () => ChangePasswordRepo(getIt()));
  // // otp
  // getIt.registerLazySingleton<OtpRepo>(() => OtpRepo(getIt()));
  // // reset password
  // getIt.registerLazySingleton<ResetPasswordRepo>(
  //     () => ResetPasswordRepo(getIt()));
  // // company info
  // getIt.registerLazySingleton<CompanyInfoRepo>(() => CompanyInfoRepo(getIt()));
}
