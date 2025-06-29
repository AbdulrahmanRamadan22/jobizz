import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/saved_jobs/data/model/saved_response.dart';

class JobStatusAndSalary extends StatelessWidget {
  const JobStatusAndSalary({
    super.key,
    required this.statusColor,
    required this.job,
  });

  final Color statusColor;
  final SavedJob? job;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: Center(
            child: Text(
              job?.jobStatus ?? 'Status unknown',
              style: TextStyles.font13LightBlueMedium,
            ),
          ),
        ),
        Text(
          job?.jobType ?? 'Type unknown',
          style: TextStyles.font14Gray,
        ),
      ],
    );
  }
}
