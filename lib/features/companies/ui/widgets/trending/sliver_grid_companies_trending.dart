import 'package:flutter/material.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';
import 'package:jobizz/features/companies/ui/widgets/company_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliverGridCompaniesTrending extends StatelessWidget {
  const SliverGridCompaniesTrending({super.key, this.companyDataList});
  final List<Company?>? companyDataList;

  @override
  Widget build(BuildContext context) {
    final isLoading = companyDataList == null;

    if (isLoading) {
      return SliverToBoxAdapter(
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return CompanyItem(companyItem: null);
          },
        ),
      );
    }

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return CompanyItem(companyItem: companyDataList![index]);
      }, childCount: 4),
    );
  }
}
