import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
// import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/helper/size_box.dart';
// import 'package:jobizz/core/widgets/showdialog_loadin.dart';
import 'package:jobizz/features/profile/logic/experience/experience_cubit.dart';
import 'package:jobizz/features/profile/ui/widgets/custom_card_data_is_empty.dart';

// import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/routing/routers_string.dart';
import '../../../logic/experience/experience_state.dart';
import '../../widgets/experience/experience_item_details.dart';

class ExperiencesScreen extends StatelessWidget {
  const ExperiencesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiences'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routes.addExperienceScreen);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 20.0.w),
        child: BlocBuilder<ExperienceCubit, ExperienceState>(
          buildWhen: (previous, current) =>
              current is GetAllExperiencesFailure ||
              current is GetAllExperiencesSuccess ||
              current is GetAllExperiencesLoading ||
              current is DeleteExperienceSuccess,
          builder: (context, state) {
            return state.maybeWhen(
              getAllExperiencesSuccess: (experiences) =>
                  CustomScrollView(slivers: [
                if (experiences.isEmpty)
                  SliverToBoxAdapter(
                    child: CustomCardDataIsEmpty(
                      title: 'No Experience Added Yet',
                      onTap: () {},
                    ),
                  ),
                SliverList.separated(
                  itemCount: experiences.length,
                  separatorBuilder: (context, index) => verticalSpace(10),
                  itemBuilder: (context, index) => ExperienceItemDetails(
                    experience: experiences[index],
                  ),
                ),
              ]),
              getAllExperiencesLoading: () =>
                  const Center(child: CircularProgressIndicator()),
              getAllExperiencesFailure: (error) =>
                  Center(child: Text(error.message.toString())),
              orElse: () => SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  // void navigateAndUpdateProfile(BuildContext context) async {
  //   final result = await context.pushNamed(Routes.addExperienceScreen);

  //   if (result == true) {
  //     log("User Profile updated successfully ");

  //     context.read<ProfileCubit>().resetProfileData();
  //   } else {
  //     log("User Profile updated failed ");
  //   }
  // }
}