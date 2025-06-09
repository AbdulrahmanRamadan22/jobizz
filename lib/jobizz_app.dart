import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/cache/shared_pref.dart';

import 'core/cache/constants.dart';
import 'core/routing/app_router.dart';
import 'core/theming/colors.dart';

class JobizzApp extends StatelessWidget {
  const JobizzApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jobizz',
        theme: ThemeData(
          // useMaterial3: true,
          
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorsApp.whiteColor,
            elevation: 0,
            scrolledUnderElevation: 0,
            iconTheme: IconThemeData(color: ColorsApp.darkBlack),
            titleTextStyle: TextStyle(
              color: ColorsApp.darkBlack,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            centerTitle: true,
          ),
          fontFamily: 'Poppins',
          primaryColor: ColorsApp.mainBlue,
          scaffoldBackgroundColor: ColorsApp.backGroundWhite,
        ),
        // home: Scaffold(body: Center(child: Text("Jobizz App"))),
        initialRoute: () {
          final route =
              SharedPrefHelper.getData(key: SharedPrefKeys.initialRoute);
          debugPrint('JobizzApp: initialRoute = $route');
          return route;
        }(),

        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
