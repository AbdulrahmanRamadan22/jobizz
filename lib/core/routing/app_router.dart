import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/routing/routers_string.dart';
import 'package:jobizz/features/auth/change_password/ui/change_password_screen.dart';
import 'package:jobizz/features/auth/register/logic/cubit/sign_up_cubit.dart';
import 'package:jobizz/features/auth/reset_password_screen/logic/cubit/resetpassword_cubit.dart';
import 'package:jobizz/features/onboarding/ui/onboarding_screen.dart';

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

      default:
        return null;
    }
  }
}
