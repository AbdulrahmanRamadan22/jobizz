import 'package:flutter/material.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';

import '../../../../../core/widgets/shimmer_loading_custom.dart';
import '../company_item.dart';


class SliverGridCompaniesTrending extends StatelessWidget {
  const SliverGridCompaniesTrending({super.key, this.companyDataList});
  final List<Company?>? companyDataList;
  @override
  Widget build(BuildContext context) {
    final isLoading = companyDataList == null;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (isLoading) {
            return  ShimmerLoadingCustom();
          } else {
            return CompanyItem(
              companyItem: companyDataList![index],
            );
          }
        },
        childCount: 4,
      ),
    );
  }
}
