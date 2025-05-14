import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/companies/ui/widgets/popular/sliver_grid_companies_popular.dart';
import 'package:jobizz/features/companies/ui/widgets/trending/sliver_grid_companies_trending.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/widgets/row_text_and_see_all.dart';
import '../../logic/cubit/company_cubit.dart';
import '../../logic/cubit/company_state.dart';

class CompanyBlocBuilder extends StatelessWidget {
  const CompanyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      buildWhen: (previous, current) =>
          current is CompanySuccess ||
          current is CompanyError ||
          current is CompanyLoading,
      builder: (context, state) {
        return state.maybeWhen(
          companyLoading: () {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: RowTextAndSeeAll(
                    text: 'Popular Now',
                    onPressed: () {},
                  ),
                ),
                const SliverGridCompaniesPopular(companyDataList: null),
                SliverToBoxAdapter(
                  child: RowTextAndSeeAll(
                    text: 'Trending Now',
                    onPressed: () {},
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpace(10)),
                const SliverGridCompaniesTrending(companyDataList: null),
              ],
            );
          },
          companySuccess: (response) {
            final trendingList = response.data?.trending;
            final popularList = response.data?.popular;

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: RowTextAndSeeAll(
                    text: 'Popular Now',
                 
                    onPressed: () {
                      context.pushNamed(
                        Routes.popularCompanyScreen,
                        arguments: popularList,
                      );
                    },
                  ),
                ),
                SliverGridCompaniesPopular(
                  companyDataList: popularList,
                ),
                SliverToBoxAdapter(
                  child: RowTextAndSeeAll(
                    text: 'Trending Now',
                   
                    onPressed: () {
                      context.pushNamed(
                        Routes.trendingCompanyScreen,
                        arguments: trendingList,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpace(10)),
                SliverGridCompaniesTrending(
                  companyDataList: trendingList,
                ),
              ],
            );
          },
          companyError: (error) {
            return Center(
              child: Text(error.message.toString()),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
