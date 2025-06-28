// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/core/widgets/row_text_and_see_all.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';
import 'package:jobizz/features/companies/ui/widgets/company_of_jobs/company_item_jobs.dart';

class FeatureCompanyJobs extends StatelessWidget {
  const FeatureCompanyJobs({
    super.key,
    this.featureJobCompany,
    this.companyItem,
  });
  final List<JobInCompany>? featureJobCompany;
  final Company? companyItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTextAndSeeAll(
          text: 'Featured Jobs',
          onPressed: () {},
        ),
        if (featureJobCompany == null || featureJobCompany?.isEmpty == true)
          Container(
            alignment: Alignment.center,
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: ColorsApp.red,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              'No Found Jobs',
              style: TextStyles.font16WhiteSemiBold,
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: featureJobCompany?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final job = featureJobCompany?[index];
              return GestureDetector(
                onTap: () {
                  // navigate to job details
                  // context.pushNamed(Routes.jobDetailsScreen, arguments: job);
                },
                child: CompanyItemJobs(
                  companyItem: companyItem,
                  jobOFCompany: job,
                ),
              );
            },
          ),
      ],
    );
  }
}
