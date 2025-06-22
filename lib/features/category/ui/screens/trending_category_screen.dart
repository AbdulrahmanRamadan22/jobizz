import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/widgets/show_generic_search_dialog.dart';

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
        elevation: 0,
        scrolledUnderElevation: 0,
        // backgroundColor: ColorsApp.backGroundWhite,
        title: Text(
          'Trending',
        ),
        // Icon Button Search
        actions: [
          IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                final List<Category> categories =
                    categoryDataList?.whereType<Category>().toList() ?? [];
                showGenericSearchDialog<Category>(
                  context: context,
                  items: categories,
                  searchFields: [
                    (category) => category.name ?? '',
                  ],
                  itemBuilder: (context, category) {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0.w,
                          vertical: 7.h,
                        ),
                        child: CategoryItem(
                          categoryItem: category,
                        ));
                  },
                  searchHint: 'Search trending categories...',
                );
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
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
