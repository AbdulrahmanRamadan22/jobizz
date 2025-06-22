import 'package:flutter/material.dart';
import 'package:jobizz/core/widgets/shimmer_loading_custom.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';
import 'package:jobizz/features/companies/ui/widgets/company_item.dart';

class SliverGridCompaniesTrending extends StatelessWidget {
  const SliverGridCompaniesTrending({super.key, this.companyDataList});
  final List<Company?>? companyDataList;

  @override
  Widget build(BuildContext context) {
    // final companies = companyDataList ?? [];
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
              companyItem: companyDataList?[index],
            );
          }
        },
        childCount: 4,
      ),
    );
  }
}
