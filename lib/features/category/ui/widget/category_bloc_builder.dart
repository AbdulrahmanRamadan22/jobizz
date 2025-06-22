import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../core/routing/routers_string.dart';
import '../../../../core/widgets/row_text_and_see_all.dart';
import '../../cubit/category_cubit.dart';
import '../../cubit/category_state.dart';
import 'popular/sliver_grid_category_popular.dart';
import 'trending/sliver_grid_category_trending.dart';

class CategoryBlocBuilder extends StatelessWidget {
  const CategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is CategoryLoading ||
          current is CategorySuccess ||
          current is CategoryFailure,
      builder: (context, state) {
        return state.maybeWhen(
            categoryLoading: () {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: RowTextAndSeeAll(
                      text: 'Popular now',
                      onPressed: () {},
                    ),
                  ),
                  SliverGridCategoryPopular(
                    categoryDataList: null,
                  ),
                  SliverToBoxAdapter(
                    child: RowTextAndSeeAll(
                      text: 'Trending now',
                      onPressed: () {},
                    ),
                  ),
                  SliverGridCategoryTrending(
                    categoryDataList: null,
                  ),
                ],
              );
            },
            categorySuccess: (response) {
              final trendingList = response.data?.trending;
              final popularList = response.data?.popular;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: RowTextAndSeeAll(
                      text: 'Popular now',
                      onPressed: () {
                        context.pushNamed(
                          Routes.popularCategoryScreen,
                          arguments: popularList,
                        );
                      },
                    ),
                  ),
                  SliverGridCategoryPopular(
                    categoryDataList: popularList,
                  ),
                  SliverToBoxAdapter(
                    child: RowTextAndSeeAll(
                      text: 'Trending now',
                      onPressed: () {
                        context.pushNamed(
                          Routes.trendingCategoryScreen,
                          arguments: trendingList,
                        );
                      },
                    ),
                  ),
                  SliverGridCategoryTrending(
                    categoryDataList: trendingList,
                  ),
                ],
              );
            },
            categoryFailure: (apiErrorModel) {
              return Center(
                child: Text(apiErrorModel.message.toString()),
              );
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }
}
