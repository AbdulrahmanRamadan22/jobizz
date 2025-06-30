import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/routing/routers_string.dart';
import 'package:jobizz/features/auth/change_password/ui/change_password_screen.dart';
import 'package:jobizz/features/auth/delet_account/logic/cubit/delete_acount_cubit.dart';
import 'package:jobizz/features/auth/register/logic/cubit/sign_up_cubit.dart';
import 'package:jobizz/features/auth/reset_password_screen/logic/cubit/resetpassword_cubit.dart';
import 'package:jobizz/features/bot_chat/ui/chat_bot_screen.dart';
import 'package:jobizz/features/category/ui/screens/category_of_jobs_screen.dart';
import 'package:jobizz/features/category/ui/screens/popular_category_screen.dart';
import 'package:jobizz/features/category/ui/screens/trending_category_screen.dart';
import 'package:jobizz/features/companies/ui/screens/company_of_jobs_screen.dart';
import 'package:jobizz/features/companies/ui/screens/profile_company_screen.dart';
import 'package:jobizz/features/job_details/job_details_screen.dart';
import 'package:jobizz/features/jobs/data/models/job.dart';

import 'package:jobizz/features/onboarding/ui/onboarding_screen.dart';
import 'package:jobizz/features/profile/logic/experience/experience_cubit.dart';
import 'package:jobizz/features/profile/ui/screens/education/add_education_screen.dart';
import 'package:jobizz/features/profile/ui/screens/experiences/experiences_screen.dart';
import 'package:jobizz/features/saved_jobs/cubit/saved_cubit.dart';
import 'package:jobizz/features/settings/ui/screens/about_screen.dart';

import '../../features/auth/change_password/logic/cubit/change_password_cubit.dart';
import '../../features/auth/forget_password_screen/logic/cubit/forget_pass_cubit.dart';
import '../../features/auth/forget_password_screen/ui/forget_pass_screen.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/auth/login/ui/login_screen.dart';
import '../../features/auth/otp_screen/logic/cubit/otp_cubit.dart';
import '../../features/auth/otp_screen/ui/otp_screen.dart';
import '../../features/auth/register/ui/register_screen.dart';
import '../../features/auth/reset_password_screen/ui/reset_password_conformation_screen.dart';
import '../../features/auth/reset_password_screen/ui/reset_password_screen.dart';
import '../../features/category/data/model/category_response.dart';
import '../../features/category/ui/screens/category_screen.dart';
import '../../features/companies/data/model/company_response.dart';
import '../../features/companies/ui/screens/compaies_screen.dart';
import '../../features/companies/ui/screens/popular_company_screen.dart';
import '../../features/companies/ui/screens/trending_company_screen.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/jobs/ui/screens/featured_jobs_screen.dart';
import '../../features/jobs/ui/screens/popular_jobs_screen.dart';
import '../../features/jobs/ui/screens/recommended_jobs_screen.dart';
import '../../features/layout/layout_screen/logic/cubit/layout_cubit.dart';
import '../../features/layout/layout_screen/ui/layout_screen.dart';
import '../../features/notifications/ui/notifications_screen.dart.dart';
import '../../features/profile/data/models/profile_response_model.dart';
import '../../features/profile/logic/education/education_cubit.dart';
import '../../features/profile/logic/profile/profile_cubit.dart';
import '../../features/profile/ui/screens/education/edit_education_screen.dart';
import '../../features/profile/ui/screens/education/educations_screen.dart';
import '../../features/profile/ui/screens/experiences/add_experiences_screen.dart';
import '../../features/profile/ui/screens/experiences/edit_experiences_screen.dart';
import '../../features/profile/ui/screens/profile_screen.dart';
import '../../features/profile/ui/screens/edit_personal_info_screen.dart';
import '../../features/saved_jobs/ui/saved_screen.dart';
import '../../features/settings/ui/screens/settings_screen.dart';
import '../../features/settings/ui/screens/terms_and_conditions.dart';
import '../../features/switch_profile/logic/switch_profile_cubit.dart';
import '../../features/switch_profile/ui/switch_profile_screen.dart';
import '../di/dependancy_ingection.dart';

// import '../../features/auth/login/ui/login_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable

    switch (settings.name) {
      // onBoarding screen
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );

      // Login screen
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: const LoginScreen(),
          ),
        );

      // register screen
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpCubit(getIt()),
            child: const RegisterScreen(),
          ),
        );

      // forgot password
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ForgetPassCubit(getIt()),
            child: const ForgetPassScreen(),
          ),
        );

      // otp screen
      case Routes.otpScreen:
        final email = settings.arguments as String;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OtpCubit(getIt()),
            child: OtpScreen(
              email: email,
            ),
          ),
        );

      // reset password
      case Routes.resetPasswordScreen:
        // final token = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ResetPasswordCubit(
              getIt(),
            ),
            child: const ResetPasswordScreen(),
          ),
        );
      // reset password conformation
      case Routes.resetPasswordConformationScreen:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordConformation(),
        );
      // change password screen
      case Routes.changePasswordScreen:
        final token = settings.arguments as String? ?? '';

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ChangePasswordCubit(getIt()),
            child: ChangePasswordScreen(token: token),
          ),
        );

      // profile Screens
      case Routes.profileScreen:
        final profileCubit = getIt<ProfileCubit>();
        // Always refresh when entering profile screen
        profileCubit.emitGetProfileDetails();

        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProfileCubit>.value(
            value: profileCubit,
            child: const ProfileScreen(),
          ),
        );

      // saved jobs screen

      case Routes.personalInfoScreen:
        final profileCubit = getIt<ProfileCubit>();
        final data = settings.arguments as ProfileData?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProfileCubit>.value(
            value: profileCubit,
            child: PersonalInfoScreen(
              profileData: data,
            ),
          ),
        );


// educations
      case Routes.educationsScreen:
        final educationCubit = getIt<EducationCubit>()..getAllEducations();

        // final educations = settings.arguments as List<Education>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: educationCubit,
            child: EducationsScreen(),
          ),
        );

      case Routes.editEducationScreen:
        final profileCubit = getIt<EducationCubit>();
        final education = settings.arguments as Education?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: profileCubit,
            child: EditEducationScreen(
              education: education,
            ),
          ),
        );


      case Routes.addEducationScreen:
        final profileCubit = getIt<EducationCubit>();
        // final education = settings.arguments as Education?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: profileCubit,
            child: AddEducationScreen(),
          ),
        );


      // case Routes.addEducationScreen:
      //   final profileCubit = getIt<ProfileCubit>();
      //   // final education = settings.arguments as Education?;
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider.value(
      //       value: profileCubit,
      //       child:  AddEducationScreen(),
      //     ),
      //   );

      //       child: AddEducationScreen(),
      //     ),
      //   );


      // Experiences
      case Routes.experiencesScreen:
        final experienceCubit = getIt<ExperienceCubit>()..getAllExperiences();
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: experienceCubit,
            child: ExperiencesScreen(),
          ),
        );

         case Routes.addExperienceScreen:
        final experienceCubit = getIt<ExperienceCubit>();
        // final education = settings.arguments as Education?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: experienceCubit,
            child: AddExperiencesScreen(),
          ),
        );

          case Routes.editExperienceScreen:
        final profileCubit = getIt<ExperienceCubit>();
        final experience = settings.arguments as Experience?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: profileCubit,
            child: EditExperiencesScreen(
              experience: experience,
            ),
          ),
        );



// saved jobs screen
      case Routes.savedJobsScreen:
        //   final savedJobs = settings.arguments as List<SavedJob?>? ?? [];
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SavedCubit(getIt())..getSavedJobs(),
            child: const SavedJobsScreen(),
          ),
        );
      // settings screen
      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DeleteAccountCubit(
              getIt(),
            ),
            child: const SettingScreen(),
          ),
        );
      // about application screen
      case Routes.aboutApplicationScreen:
        return MaterialPageRoute(
          builder: (context) => const AboutApplicationScreen(),
        );
      // termsAndConditionsScreen
      case Routes.termsAndConditionsScreen:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsScreen(),
        );
      // layout screen
      case Routes.layoutScreen:
        //  final profiles = settings.arguments as  List<Profile?>? ?? [];

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LayoutCubit(),
            child: LayoutScreens(),
          ),
        );
      // Companies Screen
      case Routes.companiesScreen:
        return MaterialPageRoute(
          builder: (context) => CompaniesScreen(),
        );
// Categories Screen
      case Routes.categoryScreen:
        return MaterialPageRoute(
          builder: (context) => CategoryScreen(),
        );

      case Routes.notificationsScreen:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );

// Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      // popularJobsScreen
      case Routes.popularJobsScreen:
        final popularJobs = settings.arguments as List<Job?>? ?? [];
        return MaterialPageRoute(
          builder: (_) => PopularJobsScreen(
            popularJobs: popularJobs,
          ),
        );
      //Jobs Details Screen
      case Routes.jobDetailsScreen:
        final jobDetails = settings.arguments as Job?;

        return MaterialPageRoute(
          builder: (context) {
            final savedCubit = context.read<LayoutCubit>().savedCubit;
            savedCubit.initSavedJob(jobDetails!);

            return BlocProvider.value(
              value: savedCubit,
              child: JobDetailsScreen(
                job: jobDetails,
              ),
            );
          },
        );

      // Featured Jobs Screen
      case Routes.featuredJobsScreen:
        final featuredJobs = settings.arguments as List<Job?>? ?? [];
        return MaterialPageRoute(
          builder: (_) => FeaturedJobsScreen(
            featuredJobs: featuredJobs,
          ),
        );
// Recommended Jobs Screen
      case Routes.recommendedJobsScreen:
        final recommendedJobs = settings.arguments as List<Job?>? ?? [];
        return MaterialPageRoute(
          builder: (_) => RecommendedJobsScreen(
            recommendedJobs: recommendedJobs,
          ),
        );

      // popularCompany screen
      case Routes.popularCompanyScreen:
        final companyDataList = settings.arguments as List<Company?>? ?? [];

        return MaterialPageRoute(
          builder: (context) => PopularCompanyScreen(
            companyDataList: companyDataList,
          ),
        );
      // TrendingCompany screen
      case Routes.trendingCompanyScreen:
        final companyDataList = settings.arguments as List<Company?>? ?? [];
        return MaterialPageRoute(
          builder: (context) => TrendingCompanyScreen(
            companyDataList: companyDataList,
          ),
        );

      // popularCategory screen
      case Routes.popularCategoryScreen:
        final categoryDataList = settings.arguments as List<Category?>? ?? [];
        return MaterialPageRoute(
          builder: (context) => PopularCategoryScreen(
            categoryDataList: categoryDataList,
          ),
        );
      // TrendingCategory screen
      case Routes.trendingCategoryScreen:
        final categoryDataList = settings.arguments as List<Category?>? ?? [];
        return MaterialPageRoute(
          builder: (context) => TrendingCategoryScreen(
            categoryDataList: categoryDataList,
          ),
        );
      // jobs Of Category screen
      case Routes.categoryOfJobsScreen:
        final categoryItemJobs = settings.arguments as Category?;
        return MaterialPageRoute(
          builder: (context) => CategoryOfJobsScreen(
            categoryItem: categoryItemJobs,
          ),
        );
      // Jobs Of Company screen
      case Routes.companyOfJobsScreen:
        final companyItemJobs = settings.arguments as Company?;
        return MaterialPageRoute(
          builder: (context) => CompanyOfJobsScreen(
            companyItem: companyItemJobs,
          ),
        );

      // profile CompanyScreen
      case Routes.profileCompanyScreen:
        final companyItemitem = settings.arguments as Company;
        return MaterialPageRoute(
          builder: (context) => ProfileCompanyScreen(
            companyItem: companyItemitem,
          ),
        );
      // chat bot ai screen
      case Routes.geminiChatScreen:
        return MaterialPageRoute(
          builder: (context) => GeminiChatScreen(),
        );
// switch profile screen
      case Routes.switchProfileScreen:
        final switchProfileCubit = getIt<SwitchProfileCubit>()
          ..emitGetProfilesDetailsData();
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: switchProfileCubit,
            child: const SwitchProfileScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
