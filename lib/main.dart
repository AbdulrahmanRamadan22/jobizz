import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/cache/constants.dart';
// import 'package:flutter/rendering.dart';
import 'package:jobizz/core/helper/bloc_observer.dart';
import 'package:jobizz/core/networking/internet_connection_service.dart';
import 'package:jobizz/core/routing/app_router.dart';
import 'package:jobizz/core/helper/extensions.dart';

import 'core/cache/shared_pref.dart';
import 'core/di/dependancy_ingection.dart';
import 'core/routing/routers_string.dart';
import 'jobizz_app.dart';

void main() async {
  // debugRepaintRainbowEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();
  InternetConnectionService();
  setupGetIt();

  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();

  // Initialize shared preferences
  await SharedPrefHelper.init();

  Bloc.observer = MyBlocObserver();

  await handelInitialRoute();

  runApp(
    Phoenix(
      child: JobizzApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

handelInitialRoute() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    key: SharedPrefKeys.token,
  );
  bool? onBoardingIsDone = await SharedPrefHelper.getData(
    key: SharedPrefKeys.onBoardingIsDone,
  );

  if (onBoardingIsDone == true) {
    if (!userToken.isNullOrEmpty()) {
      SharedPrefValues.initialRoute = Routes.layoutScreen;
    } else {
      SharedPrefValues.initialRoute = Routes.loginScreen;
    }
  } else {
    SharedPrefValues.initialRoute = Routes.onBoardingScreen;
  }
}
