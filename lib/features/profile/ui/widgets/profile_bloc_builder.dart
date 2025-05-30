

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/profile/logic/profile_cubit.dart';
import 'package:jobizz/features/profile/logic/profile_state.dart';
import 'package:jobizz/features/profile/ui/widgets/custom_card_data_is_empty.dart';
import 'package:jobizz/features/profile/ui/widgets/education/sliver_list_education.dart';
import 'package:jobizz/features/profile/ui/widgets/experience/sliver_list_experience.dart';
import 'package:jobizz/features/profile/ui/widgets/portfolio/sliver_grid_portfolio.dart';
import 'package:jobizz/features/profile/ui/widgets/resume/resume_item.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/widgets/row_text_and_see_all.dart';
import 'profile_header.dart/profile_header.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is ProfileDetailsLoading ||
          current is ProfileDetailsFailure ||
          current is ProfileDetailsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          profileDetailsLoading: () => const Center(
            child: CircularProgressIndicator(),
          ),
         
          profileDetailsSuccess: (profile) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ProfileHeader(
                    profileData: profile.profileData,
                  ),
                ),
                SliverToBoxAdapter(
                  child: RowTextAndSeeAll(
                    text: 'Experience',
                    onPressed: () {},
                  ),
                ),
                if (profile.profileData?.experiences.isEmpty ?? false)
                  SliverToBoxAdapter(
                      child: CustomCardDataIsEmpty(
                    title: 'No Work Experiences Added Yet',
                    onTap: () {},
                  )),
                SliverListExperience(
                  experiences: profile.profileData?.experiences ?? [],
                ),

                SliverToBoxAdapter(
                  child: RowTextAndSeeAll(
                    text: 'Education',
                    onPressed: () {},
                  ),
                ),
                if (profile.profileData?.educations.isEmpty ?? false)
                  SliverToBoxAdapter(
                      child: CustomCardDataIsEmpty(
                    title: 'No Education Added Yet',
                    onTap: () {},
                  )),
                SliverListEducation(
                  educations: profile.profileData?.educations ?? [],
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
                // // قسم portfolio
                SliverToBoxAdapter(
                  child: RowTextAndSeeAll(
                    text: 'Portfolio',
                    onPressed: () {},
                  ),
                ),
                SliverGridPortfolio(),
                  SliverToBoxAdapter(
                  child: verticalSpace(10.h),
                ),
              ],
            ),
          ),
           profileDetailsFailure: (error) =>
              Center(child: Text(error.message.toString())),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
