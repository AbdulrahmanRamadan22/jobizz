import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/widgets/showdialog_loadin.dart';
import 'package:jobizz/features/profile/logic/education/education_cubit.dart';
import 'package:jobizz/features/profile/ui/widgets/custom_card_data_is_empty.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../logic/education/education_state.dart';
import '../../widgets/education/education_item_details.dart';

class EducationsScreen extends StatelessWidget {
  const EducationsScreen({
    super.key,
  });

  // final List<Education>? educations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educations'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routes.addEducationScreen);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 20.0.w),
        child: BlocBuilder<EducationCubit, EducationState>(
          buildWhen: (previous, current) =>
              current is GetAllEducationsFailure ||
              current is GetAllEducationsSuccess ||
              current is GetAllEducationsLoading ||
              current is DeleteEducationSuccess,
          builder: (context, state) {
       
            return state.maybeWhen(
              getAllEducationsSuccess: (educations) =>
                  CustomScrollView(slivers: [
                if (educations.isEmpty)
                  SliverToBoxAdapter(
                    child: CustomCardDataIsEmpty(
                      title: 'No Education Added Yet',
                      onTap: () {},
                    ),
                  ),
                SliverList.separated(
                  itemCount: educations.length,
                  separatorBuilder: (context, index) => verticalSpace(10),
                  itemBuilder: (context, index) => EducationItemDetails(
                    education: educations[index],
                  ),
                ),
              ]),
              getAllEducationsLoading: () =>
                  const Center(child: CircularProgressIndicator()),
              getAllEducationsFailure: (error) =>
                  Center(child: Text(error.message.toString())),
              orElse: () => SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  // void navigateAndUpdateProfile(BuildContext context) async {
  //   final result = await context.pushNamed(Routes.addEducationScreen);

  //   if (result == true) {
  //     log("User Profile updated successfully ");

  //     context.read<ProfileCubit>().resetProfileData();
  //   } else {
  //     log("User Profile updated failed ");
  //   }
  // }
}
