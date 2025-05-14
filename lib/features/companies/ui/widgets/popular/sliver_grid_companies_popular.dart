import 'package:flutter/material.dart';

import '../../../../../core/widgets/shimmer_loading_custom.dart';
import '../../../data/model/company_response.dart';
import '../company_item.dart';


class SliverGridCompaniesPopular extends StatelessWidget {
  final List<Company?>? companyDataList;
  const SliverGridCompaniesPopular({super.key, this.companyDataList});

  @override
  Widget build(BuildContext context) {
    final isLoading = companyDataList == null;

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (isLoading) {
            return const ShimmerLoadingCustom();
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
