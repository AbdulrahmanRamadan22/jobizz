import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';
import 'package:jobizz/features/companies/ui/widgets/profile_company/details_profile_compainy.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ProfileCompanyScreen extends StatelessWidget {
  const ProfileCompanyScreen({super.key, this.companyItem});
  final Company? companyItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsApp.backGroundWhite,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsApp.backGroundWhite,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          'Company Profile',
          style: TextStyles.font16Black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
        physics: BouncingScrollPhysics(),
        child: CompanyDetails(companyItem: companyItem),
      ),
    ));
  }
}
