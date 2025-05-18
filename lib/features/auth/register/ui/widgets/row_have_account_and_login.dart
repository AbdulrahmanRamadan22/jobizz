import 'package:flutter/material.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/theming/styles.dart';

class RowHaveAccountAndButtonLogin extends StatelessWidget {
  const RowHaveAccountAndButtonLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have an account? ',
          style: TextStyles.font14Gray,
        ),

        // Text("Login"),
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero, minimumSize: Size.zero),
          child: Text(
            'Login',
            style: TextStyles.font14MainBlue,
          ),
          onPressed: () {
            context.pushNamedAndRemoveUntil(Routes.loginScreen,
                predicate: (Route<dynamic> route) {
              return false;
            });
          },
        ),
      ],
    );
  }
}
