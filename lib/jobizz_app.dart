import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routers_string.dart';

class JobizzApp extends StatelessWidget {
  const JobizzApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jobizz',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        // home: Scaffold(body: Center(child: Text("Jobizz App"))),

        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
