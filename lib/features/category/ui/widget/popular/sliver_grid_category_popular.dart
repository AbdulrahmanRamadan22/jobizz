import 'package:flutter/material.dart';

import '../../../../../core/widgets/shimmer_loading_custom.dart';
import '../../../data/model/category_response.dart';
import '../category_item.dart';

class SliverGridCategoryPopular extends StatelessWidget {
  const SliverGridCategoryPopular({super.key, this.categoryDataList});
  final List<Category?>? categoryDataList;

  @override
  Widget build(BuildContext context) {
    final isLoading = categoryDataList == null;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: 4,
        (context, index) {
          if (isLoading) {
            return const ShimmerLoadingCustom();
          } else {
            return CategoryItem(
              categoryItem: categoryDataList?[index],
            );
          }
        },
      ),
    );
  }
}
