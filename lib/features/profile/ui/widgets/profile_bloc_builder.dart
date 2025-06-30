import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/profile/data/models/profile_response_model.dart';
import 'package:jobizz/features/profile/logic/profile/profile_cubit.dart';
import 'package:jobizz/features/profile/logic/profile/profile_state.dart';
import 'package:jobizz/features/profile/ui/widgets/custom_card_data_is_empty.dart';
import 'package:jobizz/features/profile/ui/widgets/education/sliver_list_education.dart';
import 'package:jobizz/features/profile/ui/widgets/experience/sliver_list_experience.dart';
import 'package:jobizz/features/profile/ui/widgets/portfolio/portfolio_item_link.dart';
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
          profileDetailsSuccess: (profile) =>
              handelSuccessProfile(profile, context),
          profileDetailsFailure: (error) =>
              Center(child: Text(error.message.toString())),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }

  Padding handelSuccessProfile(
      ProfileResponseModel profile, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      child: CustomScrollView(
        slivers: [
          // Profile Header
          SliverToBoxAdapter(
            child: ProfileHeader(
              profileData: profile.profileData,
            ),
          ),

          // Experience Handel
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

          // Education Handel
          SliverToBoxAdapter(
            child: RowTextAndSeeAll(
              text: 'Education',
              onPressed: () {
                context.pushNamed(
                  Routes.educationsScreen,
                );
              },
            ),
          ),
          if (profile.profileData?.educations.isEmpty ?? false)
            SliverToBoxAdapter(
              child: CustomCardDataIsEmpty(
                title: 'No Education Added Yet',
                onTap: () {},
              ),
            ),
          SliverListEducation(
            educations: profile.profileData?.educations ?? [],
          ),

          // Resume Handel
          SliverToBoxAdapter(
            child: RowTextAndSeeAll(
              text: 'Resume',
              onPressed: () {
                context.pushNamed(Routes.resumeAndProtfolioScreen);
              },
            ),
          ),
          if (profile.profileData?.cvs.isEmpty ?? false)
            SliverToBoxAdapter(
              child: CustomCardDataIsEmpty(
                title: 'No Resume Added Yet',
                onTap: () {},
              ),
            ),
          if (profile.profileData?.cvs.isNotEmpty ?? false) SliverListResume(),

          SliverToBoxAdapter(
            child: RowTextAndSeeAll(
              text: 'Portfolio',
              onPressed: () {},
            ),
          ),
          if (profile.profileData?.portfolios?.images == null &&
              profile.profileData?.portfolios?.url == null &&
              profile.profileData?.portfolios?.pdf == null)
            SliverToBoxAdapter(
              child: CustomCardDataIsEmpty(
                title: 'No Portfolio Added Yet',
                onTap: () {},
              ),
            ),

          if (profile.profileData?.portfolios?.url?.isNotEmpty ?? false)
            SliverToBoxAdapter(
              child: PortfolioItemLink(
                url: profile.profileData?.portfolios?.url?.first.url,
              ),
            ),

          SliverGridPortfolioImages(
              images:
                  profile.profileData?.portfolios?.images?.first.images ?? []),
          SliverToBoxAdapter(
            child: verticalSpace(16.h),
          ),
        ],
      ),
    );
  }
}
