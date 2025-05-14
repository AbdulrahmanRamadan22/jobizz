import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/company_bloc_builder.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Companies',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 20.h,
          left: 20.w,
          right: 20.w,
        ),
        child: CompanyBlocBuilder(),
      ),
    );
  }
}
