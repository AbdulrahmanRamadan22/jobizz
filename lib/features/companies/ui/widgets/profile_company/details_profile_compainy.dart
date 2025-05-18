import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';
import 'package:jobizz/features/companies/ui/widgets/profile_company/container_of_profile_company.dart';

import 'package:skeletonizer/skeletonizer.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({super.key, this.companyItem});

  final Company? companyItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 95.h,
            width: 95.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorsApp.mainBlue,
                width: 3.w,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.network(
                  companyItem?.logo ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image_not_supported);
                  },
                ),
              ),
            ),
          ),
        ),
        verticalSpace(17),
        Text('Name Of Company', style: TextStyles.font16Black),
        verticalSpace(15),
        ContainerOfProfileCompany(
          companyItem: companyItem,
          text: companyItem?.name ?? 'not found name',
        ),
        verticalSpace(15),
        Text('Count Of Jobs', style: TextStyles.font16Black),
        verticalSpace(10),
        ContainerOfProfileCompany(
          companyItem: companyItem,
          text: companyItem?.jobsCount.toString() ?? 'not found jobs count',
        ),
        verticalSpace(15),
        Text('Establishment Date', style: TextStyles.font16Black),
        verticalSpace(10),
        ContainerOfProfileCompany(
          companyItem: companyItem,
          text: companyItem?.createdAt ?? 'not found date',
        ),
        verticalSpace(15),
        Text('Country', style: TextStyles.font16Black),
        verticalSpace(10),
        ContainerOfProfileCompany(
          companyItem: companyItem,
          text: companyItem?.location ?? 'not found location',
        ),
        verticalSpace(15),
        Text('Description', style: TextStyles.font16Black),
        verticalSpace(10),
        ContainerOfProfileCompany(
          companyItem: companyItem,
          text: companyItem?.description ?? 'not found description',
        ),
      ],
    );
  }
}
