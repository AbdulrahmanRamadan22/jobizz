import 'package:dio/dio.dart';
import 'package:jobizz/core/networking/api_constants.dart';
import 'package:jobizz/features/saved_jobs/data/model/saved_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import '../../features/auth/change_password/data/model/change_password_request.dart';
import '../../features/auth/change_password/data/model/change_password_response.dart';
import '../../features/auth/forget_password_screen/data/models/forget_pass_request.dart';
import '../../features/auth/forget_password_screen/data/models/forget_pass_response.dart';
import '../../features/auth/login/data/model/login_request.dart';
import '../../features/auth/login/data/model/login_response.dart';
import '../../features/auth/otp_screen/data/model/otp_request.dart';
import '../../features/auth/otp_screen/data/model/otp_response.dart';
import '../../features/auth/register/data/model/sign_up_request.dart';
import '../../features/auth/register/data/model/sign_up_response.dart';
import '../../features/auth/reset_password_screen/data/model/reset_passwoed_response.dart';
import '../../features/auth/reset_password_screen/data/model/reset_password_requast.dart';
import '../../features/category/data/model/category_response.dart';
import '../../features/companies/data/model/company_response.dart';
import '../../features/home/data/model/home_response_model.dart';
import '../../features/profile/data/models/profile_response_model.dart';
import '../../features/switch_profile/data/models/profile_response_model.dart';

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
  // forgot password service
  @POST(ApiConstant.forgetPassword)
  Future<ForgetPasswordResponse> forgetpassword(
    @Body() ForgetPassRequest forgetPassRequest,
  );
  // otp valid service
  @POST(ApiConstant.otpCode)
  Future<OtpResponse> otpValid(
    @Body() OtpRequestCode otpRequestCode,
  );
  // reset password service otp
  @POST(ApiConstant.resetPassword)
  Future<ResetPasswordResponse> resetPasswordValid(
    @Header("Authorization") String token,
    @Body() ResetPasswordRequest resetPasswordRequest,
  );

  // change password service
  @POST(ApiConstant.changePassword)
  Future<ChangePasswordResponse> changePassword(
    @Header("Authorization") String token,
    @Body() ChangePasswordRequest changePasswordRequest,
  );

// get company info
  @GET(ApiConstant.getCompanyInfo)
  Future<CompanyResponse> getCompanyInfo(
    @Header("Authorization") String token,
  );
// get categories
  @GET(ApiConstant.getCategories)
  Future<CategoryResponse> getCategories(
    @Header("Authorization") String token,
  );
// get home data
  @GET(ApiConstant.home)
  Future<HomeResponseModel> homeData(
    @Header("Authorization") String token,
  );

  @GET("${ApiConstant.getProfileById}/{id}")
  Future<ProfileResponseModel> getProfileDetailsById(
    @Path('id') int id,
    @Header('Authorization') String token,
  );

  @PUT("${ApiConstant.editGeneralProfileData}/{id}")
  Future<dynamic> updateGeneralProfileData(
    @Path('id') int id,
    @Header('Authorization') String token,
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConstant.addEducation)
  Future<dynamic> addEducation(
    @Path('profileId') int profileId,
    @Header('Authorization') String token,
    @Body() Education education,
  );

  @DELETE(ApiConstant.deleteEducation)
  Future<dynamic> deleteEducation(
    @Path('profileId') int profileId,
    @Path('educationId') int educationId,
    @Header('Authorization') String token,
  );

  @PUT(ApiConstant.updateEducation)
  Future<dynamic> updateEducation(
      @Path('profileId') int profileId,
      @Path('educationId') int educationId,
      @Header('Authorization') String token,
      @Body() Education? education);

  @GET(ApiConstant.getProfilesDetails)
  Future<ProfilesResponseModel> getProfilesDetails(
    @Header('Authorization') String token,
  );

  @POST(ApiConstant.addFavorite)
  Future<dynamic> addFavorite(
    @Header('Authorization') String token,
    @Path('profileId') int profileId,
    @Path('itemId') int itemId,
  );

  @GET(ApiConstant.getFavorites)
  Future<SavedResponse> getFavorites(
    @Header('Authorization') String token,
    @Path('profileId') int profileId,
  );
}
