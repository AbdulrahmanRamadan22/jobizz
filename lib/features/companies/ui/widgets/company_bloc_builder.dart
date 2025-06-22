import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/routing/routers_string.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/core/widgets/row_text_and_see_all.dart';
import 'package:jobizz/features/companies/logic/cubit/company_cubit.dart';
import 'package:jobizz/features/companies/logic/cubit/company_state.dart';
import 'package:jobizz/features/companies/ui/widgets/popular/sliver_grid_companies_popular.dart';
import 'package:jobizz/features/companies/ui/widgets/trending/sliver_grid_companies_trending.dart';

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
                    textStyle: TextStyles.font16Black,
                    seeAllTextStyle: TextStyles.font12Gray,
                    onPressed: () {},
                  ),
                ),
                const SliverGridCompaniesPopular(
                  companyDataList: null, // Placeholder for loading state
                ),
                SliverToBoxAdapter(
                  child: RowTextAndSeeAll(
                    text: 'Trending Now',
                    textStyle: TextStyles.font16Black,
                    seeAllTextStyle: TextStyles.font12Gray,
                    onPressed: () {},
                  ),
                ),
                const SliverGridCompaniesTrending(
                  companyDataList: null, // Placeholder for loading state
                ),
              ],
            );
          },
          companySuccess: (response) {
            final trendingList = response.data?.trending;
            final populedList = response.data?.popular;

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: RowTextAndSeeAll(
                    text: 'Popular Now',
                    textStyle: TextStyles.font16Black,
                    seeAllTextStyle: TextStyles.font12Gray,
                    onPressed: () {
                      context.pushNamed(
                        Routes.popularCompanyScreen,
                        arguments: populedList,
                      );
                    },
                  ),
                ),
                SliverGridCompaniesPopular(
                  companyDataList: populedList,
                ),
                SliverToBoxAdapter(
                  child: RowTextAndSeeAll(
                    text: 'Trending Now',
                    textStyle: TextStyles.font16Black,
                    seeAllTextStyle: TextStyles.font12Gray,
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
          orElse: () {
            return Center(
              child: CircularProgressIndicator(
                color: ColorsApp.darkBlue,
              ),
            );
          },
        );
      },
    );
  }
}
