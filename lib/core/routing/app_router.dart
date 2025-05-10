import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/routing/routers_string.dart';
import 'package:jobizz/features/auth/register/logic/cubit/sign_up_cubit.dart';
import 'package:jobizz/features/onboarding/ui/onboarding_screen.dart';

import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/auth/login/ui/login_screen.dart';
import '../../features/auth/register/ui/register_screen.dart';
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

      default:
        return null;
    }
  }
}
