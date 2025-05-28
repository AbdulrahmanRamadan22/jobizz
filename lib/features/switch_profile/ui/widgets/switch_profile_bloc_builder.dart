import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/switch_profile/data/models/profile_response_model.dart';
import 'package:jobizz/features/switch_profile/ui/widgets/list_view_switch_profiles.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/switch_profile_cubit.dart';
import '../../logic/switch_profile_state.dart';

class SwitchProfileBlocBuilder extends StatelessWidget {
  const SwitchProfileBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchProfileCubit, SwitchProfileState>(
      buildWhen: (previous, current) =>
          current is GetProfilesLoading ||
          current is GetProfilesSuccess ||
          current is GetProfilesFailure,
      builder: (context, state) {
        return state.maybeWhen(
          getProfilesLoading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          getProfilesSuccess: (profiles) => getProfilesSuccess(profiles),
          getProfilesFailure: (apiErrorModel) =>
              Text(apiErrorModel.message ?? "unknown error"),
          orElse: () => const SizedBox(),
        );
      },
    );
  }

  Widget getProfilesSuccess(ProfilesResponseModel profiles) {
    return Column(
      children: [
        Text('Select Profile', style: TextStyles.font22DarkBlackBold),
        verticalSpace(20),
        Expanded(
          child: ListViewSwitchProfiles(
            profiles: profiles.data.profiles,
          ),
        ),
        if (profiles.data.profiles?.length == 1)
          FloatingActionButton.extended(
            heroTag: "addProfile",
            isExtended: true,
            backgroundColor: ColorsApp.mainBlue,
            onPressed: () {},
            label: Text(
              "Add Profile",
              style: TextStyle(color: ColorsApp.whiteColor),
            ),
            icon: const Icon(Icons.add, color: ColorsApp.whiteColor),
          ),
        verticalSpace(20),
      ],
    );
  }
}
