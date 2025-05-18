import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/routing/routers_string.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({super.key, this.companyItem});
  final Company? companyItem;

  @override
  Widget build(BuildContext context) {
    final isLoading = companyItem == null;
    final hasImage = companyItem?.logo != null && companyItem!.logo!.isNotEmpty;

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.companyOfJobsScreen,
          arguments: companyItem,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorsApp.whiteColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: ColorsApp.lightGray),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading
                  ? Container(
                      height: 45.h,
                      width: 45.h,
                      decoration: BoxDecoration(
                        color: ColorsApp.lightGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )
                  : hasImage
                      ? Image.network(
                          companyItem!.logo!,
                          height: 45.h,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(height: 45.h),
              verticalSpace(10),
              isLoading
                  ? Container(
                      height: 12.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: ColorsApp.lightGray,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )
                  : Text(
                      companyItem?.name ?? '',
                      style: TextStyles.font14Black,
                      textAlign: TextAlign.center,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
