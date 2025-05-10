import 'package:flutter/material.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/theming/styles.dart';

class RowHaveAccountAndButtonRegister extends StatelessWidget {
  const RowHaveAccountAndButtonRegister({
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
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(
            'Register',
            style: TextStyles.font14MainBlue,
          ),
          onPressed: () {
            context.pushNamedAndRemoveUntil(Routes.registerScreen,
                predicate: (Route<dynamic> route) {
              return false;
            });
          },
        ),
      ],
    );
  }
}
