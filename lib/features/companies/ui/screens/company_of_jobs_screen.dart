// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/size_box.dart';

import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';
import 'package:jobizz/features/companies/ui/widgets/company_of_jobs/company_of_jobs_containers.dart';
import 'package:jobizz/features/companies/ui/widgets/company_of_jobs/featuer_company_jobs.dart';

import '../../../../core/theming/styles.dart';

class CompanyOfJobsScreen extends StatelessWidget {
  const CompanyOfJobsScreen({
    super.key,
    this.companyItem,
  });

  final Company? companyItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ColorsApp.whiteColor,
        title: Text(
          '${companyItem?.name ?? ''} Jobs',
          style: TextStyles.font16DarkBlackSemiBold,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CompanyOfJobsContainers(companyItem: companyItem),
            verticalSpace(15.h),
            FeatureCompanyJobs(
              companyItem: companyItem,
              featureJobCompany: companyItem?.jobs ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
