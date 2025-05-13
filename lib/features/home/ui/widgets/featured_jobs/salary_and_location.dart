import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';

class SalaryAndLocation extends StatelessWidget {
  const SalaryAndLocation({
    super.key,
    this.salary,
    this.location,
  });

  final String? salary;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
      child: Row(
        children: [
          Text('\$${salary ?? ''}/year', style: TextStyles.font13White),
          Spacer(),
          Text(
            location ?? '',
            style: TextStyles.font13White,
          )
        ],
      ),
    );
  }
}
