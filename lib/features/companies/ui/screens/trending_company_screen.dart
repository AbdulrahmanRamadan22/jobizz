import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../data/model/company_response.dart';
import '../widgets/company_item.dart';

class TrendingCompanyScreen extends StatelessWidget {
  const TrendingCompanyScreen({super.key, this.companyDataList});
  final List<Company?>? companyDataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ColorsApp.backGroundWhite,
        title: const Text('Trending Companies'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
