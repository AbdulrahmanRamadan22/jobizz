import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/companies/ui/widgets/company_bloc_builder.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsApp.backGroundWhite,
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text('Companies'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.0.w,
          vertical: 20.h,
        ),
        child: CompanyBlocBuilder(),
      ),
    );
  }
}
