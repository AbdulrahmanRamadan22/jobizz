import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';
import 'package:jobizz/features/companies/ui/widgets/company_item.dart';

class PopularCompanyScreen extends StatelessWidget {
  const PopularCompanyScreen({super.key, this.companyDataList});
  final List<Company?>? companyDataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsApp.backGroundWhite,
        scrolledUnderElevation: 0,
        title: Text(
          'Popular ',
          style: TextStyles.font16Black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: GridView.builder(
          itemCount: companyDataList?.length ?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return CompanyItem(
              companyItem: companyDataList?[index],
            );
          },
        ),
      ),
    );
  }
}
