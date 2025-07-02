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
  

// educations
  static const String getAllEducations = "auth/profiles/{profileId}/educations";
  static const String addEducation = "auth/profiles/{profileId}/educations/add-education";
  static const String updateEducation = "auth/profiles/{profileId}/educations/{educationId}";
  static const String deleteEducation = "auth/profiles/{profileId}/educations/{educationId}";



// experiences


  static const String getAllExperiences = "auth/profiles/{profileId}/experiences";
  static const String addExperience = "auth/profiles/{profileId}/experiences/add-experience";
  static const String updateExperience = "auth/profiles/{profileId}/experiences/{experienceId}";
  static const String deleteExperience = "auth/profiles/{profileId}/experiences/{experienceId}";



// resumes
  static const String getAllResumes = "auth/profiles/{profileId}/cvs/getAllCvs";
  static const String addResume = "auth/profiles/{profileId}/resumes/add-resume";
  static const String updateResume = "auth/profiles/{profileId}/resumes/{resumeId}";
  static const String deleteResume = "auth/profiles/{profileId}/resumes/{resumeId}";

  static const String addApplication = "auth/profile/{profileId}/applications/add-application/{jobId}";


// {{baseUrl}}/auth/profile/14/applications/add-application/14



}
// ${SharedPrefHelper.getData(key: SharedPrefKeys.fullName) ?? ''}
