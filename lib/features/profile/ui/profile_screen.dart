import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/profile/logic/profile_cubit.dart';
import 'package:jobizz/features/profile/logic/profile_state.dart';
import 'package:jobizz/features/profile/ui/widgets/image_and_named_and_job.dart';
import 'package:jobizz/features/profile/ui/widgets/experience/sliver_list_experience.dart';

import '../../../core/routing/routers_string.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/row_text_and_see_all.dart';
import 'widgets/sliver_grid_portfolio.dart';
import 'widgets/sliver_list_education.dart';
import 'widgets/sliver_list_resume.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: TextStyles.font14Gray,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) =>
            current is ProfileDetailsLoading ||
            current is ProfileDetailsFailure ||
            current is ProfileDetailsSuccess,
        builder: (context, state) {
          return state.maybeWhen(
            profileDetailsLoading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            profileDetailsFailure: (error) =>
                Center(child: Text(error.message ?? "Unknown error")),
            profileDetailsSuccess: (profile) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ImageAndNamedAndJob(
                   profileData: profile.profileData,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: RowTextAndSeeAll(
                      text: 'Experience',
                      onPressed: () {},
                    ),
                  ),
                  SliverListExperience(
                     experiences: profile.profileData?.experiences??[],
                  ),

                  SliverToBoxAdapter(
                    child: RowTextAndSeeAll(
                      text: 'Education',
                      onPressed: () {},
                    ),
                  ),
                  SliverListEducation(
                     educations: profile.profileData?.educations??[],
                  ),
                  SliverToBoxAdapter(
                    child: RowTextAndSeeAll(
                      text: 'Resume',
                      onPressed: () {
                        context.pushNamed(Routes.resumeAndProtfolioScreen);
                      },
                    ),
                  ),
                  SliverListResume(),
                  // قسم portfolio
                  SliverToBoxAdapter(
                    child: RowTextAndSeeAll(
                      text: 'Portfolio',
                      onPressed: () {},
                    ),
                  ),
                  SliverGridPortfolio(),
                ],
              ),
            ),
            orElse: () => SizedBox.shrink(),
          );

          // if (state is ProfileDetailsSuccess) {
          //   return Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          //     child: CustomScrollView(
          //       slivers: [
          //         SliverToBoxAdapter(
          //           child: ImageAndNamedAndJob(),
          //         ),
          //         SliverToBoxAdapter(
          //           child: RowTextAndSeeAll(
          //             text: 'Experience',
          //             onPressed: () {},
          //           ),
          //         ),
          //         SliverListExperience(),

          //         SliverToBoxAdapter(
          //           child: RowTextAndSeeAll(
          //             text: 'Education',
          //             onPressed: () {},
          //           ),
          //         ),
          //         SliverListEducation(),
          //         SliverToBoxAdapter(
          //           child: RowTextAndSeeAll(
          //             text: 'Resume',
          //             onPressed: () {
          //               context.pushNamed(Routes.resumeAndProtfolioScreen);
          //             },
          //           ),
          //         ),
          //         SliverListResume(),
          //         // قسم portfolio
          //         SliverToBoxAdapter(
          //           child: RowTextAndSeeAll(
          //             text: 'Portfolio',
          //             onPressed: () {},
          //           ),
          //         ),
          //         SliverGridPortfolio(),
          //       ],
          //     ),
          //   );
          // }
          // return SizedBox.shrink();
        },
      ),
    );
  }
}
