
  import 'package:flutter/material.dart';
import 'package:jobizz/core/theming/colors.dart';

void showSnackBar(BuildContext context,{required String message, Color backgroundColor=ColorsApp.mainBlue}){ {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(message),
      ),
    );
  }
}
