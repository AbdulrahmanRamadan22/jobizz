import 'package:flutter/material.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:lottie/lottie.dart';

import '../theming/styles.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/offline.json',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            verticalSpace(40),
            Text('No Internet Connection', style: TextStyles.font22BlackBold),
            verticalSpace(20),
            Text(
              'Please check your internet connection and try again.',
              style: TextStyles.font14Gray,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
