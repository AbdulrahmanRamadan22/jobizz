import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/switch_profile/ui/widgets/switch_profile_bloc_builder.dart';

class SwitchProfileScreen extends StatelessWidget {
  const SwitchProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch Profile')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 30.h),
        child: Column(
          children: [
            Expanded(child: SwitchProfileBlocBuilder()),
            // SwitchProfileListener(),
          ],
        ),
      ),
    );
  }
}



