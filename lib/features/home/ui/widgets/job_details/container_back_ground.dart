import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/theming/colors.dart';

class ContainerBackGround extends StatelessWidget {
  const ContainerBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 375.h,
      decoration: BoxDecoration(
        color: ColorsApp.darkBlue,
      ),
    );
  }
}
