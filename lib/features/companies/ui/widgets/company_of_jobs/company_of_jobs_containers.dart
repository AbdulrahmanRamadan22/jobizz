import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/routing/routers_string.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/core/widgets/button_app_text.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';

class CompanyOfJobsContainers extends StatelessWidget {
  const CompanyOfJobsContainers({
    super.key,
    required this.companyItem,
  });

  final Company? companyItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorsApp.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Open column
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Open', style: TextStyles.font14Gray),
                  verticalSpace(4),
                  Text(
                    '${companyItem?.jobsCount.toString()}',
                    style: TextStyles.font16DarkBlackSemiBold,
                  ),
                ],
              ),

              // Logo & Name column
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    // radius: 25.r,
                    child: Image.network(
                      companyItem?.logo ?? '',
                      height: 45.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  verticalSpace(6),
                  Text(
                    companyItem?.name ?? 'Not found',
                    style: TextStyles.font16DarkBlackSemiBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Hired column
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Hired', style: TextStyles.font14Gray),
                  verticalSpace(4),
                  Text(
                    '${companyItem?.hiredPeople ?? 0}K',
                    style: TextStyles.font16DarkBlackSemiBold,
                    

                  ),
                ],
              ),
            ],
          ),
          verticalSpace(16),
          AppTextButton(
            borderRadius: 15.0,
            buttonHeight: 50.h,
            backgroundColor: ColorsApp.whiteColor,
            buttonText: 'View Profile',
            textStyle: TextStyles.font166MainBlueMedium,
            onPressed: () {
              context.pushNamed(
                Routes.profileCompanyScreen,
                arguments: companyItem,
              );
            },
          ),
        ],
      ),
    );
  }
}
