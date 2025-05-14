import 'package:flutter/material.dart';

import '../../data/model/category_response.dart';
import '../widget/category_item.dart';

class TrendingCategoryScreen extends StatelessWidget {
  const TrendingCategoryScreen({
    super.key,
    this.categoryDataList,
  });
  final List<Category?>? categoryDataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ColorsApp.backGroundWhite,

        title: Text(
          'Trending',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 20,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) => CategoryItem(
            categoryItem: categoryDataList?[index],
          ),
          itemCount: categoryDataList?.length ?? 0,
        ),
      ),
    );
  }
}
