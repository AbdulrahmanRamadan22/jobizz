// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';

import '../../../../jobs/data/models/job.dart';
import '../../../data/model/company_response.dart';

class CompanyItemJobs extends StatelessWidget {
  const CompanyItemJobs({
    super.key,
    this.companyItem,
    this.job,
  });
  final Company? companyItem;
  final Job? job;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        color: ColorsApp.whiteColor,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: ColorsApp.lightGray,
          width: 0.7,
        ),
      ),
      child: Column(
        spacing: 7,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: ColorsApp.whiteColor,
            radius: 28.r,
            child: Image.network(
              companyItem?.logo ?? '',
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  color: ColorsApp.red,
                );
              },
              fit: BoxFit.cover,
              height: 50.h,
            ),
          ),
          Text(
            job?.title ?? '',
            style: TextStyles.font14DarkBlackSemiBold,
            textAlign: TextAlign.center,
          ),
          Text(
            companyItem?.name ?? 'no Found',
            style: TextStyles.font14Gray,
            textAlign: TextAlign.center,
          ),
          // Text(
          //   job?.salary.toString() ?? 'no Found',
          //   style: TextStyles.font12DarkBlack,
          // ),
        ],
      ),
    );
  }
}
