import 'package:flutter/material.dart';
import 'package:jobizz/core/routing/routers_string.dart';
import 'package:jobizz/features/onboarding/ui/onboarding_screen.dart';

import '../../features/auth/login/ui/login_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable

    switch (settings.name) {
      // onBoarding screen
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      default:
        return null;
    }
  }
}
