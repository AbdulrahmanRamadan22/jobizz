import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/rendering.dart';
import 'package:jobizz/core/helper/bloc_observer.dart';
import 'package:jobizz/core/routing/app_router.dart';

import 'core/cache/shared_pref.dart';
import 'core/di/dependancy_ingection.dart';
import 'jobizz_app.dart';

void main() async {
  // debugRepaintRainbowEnabled = true;

  // WidgetsFlutterBinding.ensureInitialized();
   setupGetIt();
  await ScreenUtil.ensureScreenSize();

  // Initialize shared preferences
  await SharedPrefHelper.init();

  Bloc.observer = MyBlocObserver();
  // Check login status
  // final bool isLoggedIn = SharedPrefHelper.isLoggedIn();
  // // final String initialRoute =
  //     isLoggedIn ? Routes.homeScreen : Routes.loginScreen;

  runApp(JobizzApp(
    appRouter: AppRouter(),
  ));
}
