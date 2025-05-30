import 'package:flutter/material.dart';
import 'package:jobizz/features/profile/ui/widgets/profile_bloc_builder.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: TextStyles.font14Gray,
            ),
          ),
        ],
      ),
      body: ProfileBlocBuilder(),
    );
  }
}


