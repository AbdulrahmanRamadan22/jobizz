import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> showDialogLoading(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => Center(
      child: Lottie.asset(
        'assets/lottie/Loading_static.json',
        width: 200,
        height: 200,
      ),
    ),
  );
}
