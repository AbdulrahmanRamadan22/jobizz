//
import 'package:dio/dio.dart';
import 'package:jobizz/core/networking/api_constants.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

import '../../features/auth/login/data/model/login_request.dart';
import '../../features/auth/login/data/model/login_response.dart';
import '../../features/auth/register/data/model/sign_up_request.dart';
import '../../features/auth/register/data/model/sign_up_response.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApisServices {
  factory ApisServices(Dio dio, {String baseUrl}) = _ApisServices;
// sign up service
  @POST(ApiConstant.register)
  Future<SignUpResponse> signUp(
    @Body() SignUpRequest signUpRequest,
  );
    @POST(ApiConstant.googleAuth)
  Future<SignUpResponse> googleAuthSignUp(
    @Body() Map<String, dynamic> data,
  );
  // login service
  @POST(ApiConstant.login)
  Future<LoginResponse> login(
    @Body() LoginRequest loginRequest,
  );

  //  google auth service
  @POST(ApiConstant.googleAuth)
  Future<LoginResponse> googleAuth(
    @Body() Map<String, dynamic> data,
  );
//   // forgot password service

//   @POST(ApiConstant.forgetPassword)
//   Future<ForgetPasswordResponse> forgetpassword(
//     @Body() ForgetPassRequaset forgetPassRequaset,
//   );
//   // otp valid service
//   @POST(ApiConstant.otpCode)
//   Future<OtpResponse> otpValid(
//     @Body() OtpRequestCode otpRequestCode,
//   );
//   // reset password service otp
//   @POST(ApiConstant.resetPassword)
//   Future<ResetPasswordResponse> resetPasswordValied(
//     @Header("Authorization") String token,
//     @Body() ResetPasswordRequest resetPasswordRequest,
//   );
// // get company info
//   @GET(ApiConstant.getCompanyInfo)
//   Future<GetCompanyResponse> getCompanyInfo(
//     @Header("Authorization") String token,
//   );
//   // google auth service
//   @POST(ApiConstant.googleAuth)
//   Future<LoginResponse> googleAuth(
//     @Body() Map<String, dynamic> data,
//   );
//   @POST(ApiConstant.googleAuth)
//   Future<SignUpResponse> googleAuthSignUp(
//     @Body() Map<String, dynamic> data,
//   );

//   // change password service
//   @POST(ApiConstant.changePassword)
//   Future<ChangePasswordResponse> changePassword(
//     @Header("Authorization") String token,
//     @Body() ChangePasswordRequest changePasswordRequest,
//   );
}
