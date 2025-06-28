class ApiConstant {
  // Auth
  static const String apiBaseUrl = "https://jobizaa.com/api/";
  static const String register = "auth/register";
  static const String login = "auth/login";
  static const String googleAuth = "auth/google-login";
  static const String forgetPassword = "auth/password/reset-request";
  static const String otpCode = "auth/password/verify-pin";
  static const String resetPassword = "auth/password/reset";
  static const String changePassword = "auth/password/change-password";

  static const String home = "auth/home";

  static const String getCompanyInfo = "auth/companies";
  static const String getCategories = "auth/categories";

  static const String getProfileById = "auth/profiles";

  static const String getProfilesDetails = "auth/profiles/details";
  static const String addFavorite =
      "auth/profile/{profileId}/favorites/control/{itemId}";
  static const String getFavorites = "auth/profile/{profileId}/favorites";

  static const String editGeneralProfileData = "auth/profiles";

  static const String deleteAccount = "auth/delete-account";
  




}
// ${SharedPrefHelper.getData(key: SharedPrefKeys.fullName) ?? ''}
