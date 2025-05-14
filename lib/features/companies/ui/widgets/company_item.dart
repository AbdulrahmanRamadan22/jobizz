import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/model/company_response.dart';


class CompanyItem extends StatelessWidget {
  const CompanyItem({
    super.key,
    this.companyItem,
  });
  final Company? companyItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.whiteColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: ColorsApp.lightGray,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              companyItem?.logo ?? 'icon not found',
              height: 45.h,
              fit: BoxFit.cover,
            ),
            Text(companyItem?.name ?? 'company not found',
                style: TextStyles.font14Black),
          ],
        ),
      ),
    );
  }
}
