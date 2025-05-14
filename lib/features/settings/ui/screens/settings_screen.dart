import 'package:flutter/material.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 21.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Applications',
                style: TextStyles.font14Gray,
              ),
              verticalSpace(20),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.password_rounded,
                  color: ColorsApp.lightBlueGray,
                  size: 30.0,
                ),
                title: Text(
                  'Change Password',
                  style: TextStyles.font16Black,
                ),
                onTap: () {
                  context.pushNamed(Routes.changePasswordScreen);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.delete_outlined,
                  color: ColorsApp.red,
                  size: 30.0,
                ),
                title: Text(
                  'Delete Account',
                  style: TextStyles.font16Red,
                ),
                onTap: () {},
              ),
              verticalSpace(20),
              Text(
                'About',
                style: TextStyles.font14Gray,
              ),
              verticalSpace(20),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.description,
                  color: ColorsApp.lightBlueGray,
                  size: 30.0,
                ),
                title: Text(
                  'Terms and conditions',
                  style: TextStyles.font16Black,
                ),
                onTap: () {
                  context.pushNamed(Routes.termsAndConditionsScreen);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.question_mark_outlined,
                  color: ColorsApp.lightBlueGray,
                  size: 30.0,
                ),
                title: Text(
                  'About',
                  style: TextStyles.font16Black,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
