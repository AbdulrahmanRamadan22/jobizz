// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';

class CompanyItemJobs extends StatelessWidget {
  const CompanyItemJobs({
    super.key,
    this.companyItem,
    this.jobOFCompany,
  });
  final Company? companyItem;
  final Job? jobOFCompany;

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
              fit: BoxFit.cover,
              height: 50.h,
            ),
          ),
          Text(
            jobOFCompany?.title ?? '',
            style: TextStyles.font14DarkBlackSemiBold,
            textAlign: TextAlign.center,
          ),
          Text(
            companyItem?.name ?? 'no Found',
            style: TextStyles.font14Gray,
            textAlign: TextAlign.center,
          ),
          Text(
            '${jobOFCompany?.jobSalary} \$',
            style: TextStyles.font12DarkBlack,
          ),
        ],
      ),
    );
  }
}
