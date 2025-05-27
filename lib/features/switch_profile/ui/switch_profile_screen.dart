import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/features/switch_profile/logic/switch_profile_cubit.dart';
import 'package:jobizz/features/switch_profile/logic/switch_profile_state.dart';

import '../../../core/routing/routers_string.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/showdialog_errors.dart';
import '../../../core/widgets/showdialog_loadin.dart';
import '../data/models/profile_response_model.dart';

class SwitchProfileScreen extends StatelessWidget {
  const SwitchProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch Profile')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 30.h),
        child: BlocBuilder<SwitchProfileCubit, SwitchProfileState>(
          buildWhen: (previous, current) =>
              current is GetProfilesDetailsLoading ||
              current is GetProfilesDetailsSuccess ||
              current is GetProfilesDetailsFailure,
          builder: (context, state) {
            return state.maybeWhen(
              getProfilesDetailsLoading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              getProfilesDetailsSuccess: (profiles) => Column(
                children: [
                  Text('Select Profile', style: TextStyles.font22DarkBlackBold),
                  verticalSpace(20.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: profiles.data.profiles?.length,
                      itemBuilder: (context, index) {
                        // final profile = state.profiles[index];
                        return SwitchProfileItem(
                          profileModel: profiles.data.profiles?[index],
                        );
                      },
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
                  verticalSpace(20.h),
                ],
              ),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}

class SwitchProfileItem extends StatelessWidget {
  final ProfileModel? profileModel;
  const SwitchProfileItem({
    super.key,
    required this.profileModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SwitchProfileCubit, SwitchProfileState>(
      listenWhen: (previous, current) =>
          current is ProfileDetailsByIdLoading ||
          current is ProfileDetailsByIdSuccess ||
          current is ProfileDetailsByIdFailure,
      listener: (context, state) {
        state.whenOrNull(
          profileDetailsByIdLoading: () {
            showDialogLoading(context);
          },
          profileDetailsByIdSuccess: (profileResponse) {
            context.read<SwitchProfileCubit>().isFirstLoad = false;
            context.pop();
            Phoenix.rebirth(context);
          },
          profileDetailsByIdFailure: (apiErrorModel) {
            context.pop();
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: GestureDetector(
          onTap: () {
            if (profileModel?.isDefault == 1) {
             

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: ColorsApp.mainBlue,
                  duration: const Duration(seconds: 1),
                  content: Text("You are already on this profile")));

              context.pop();
            } else {
              context
                  .read<SwitchProfileCubit>()
                  .emitGetProfileByIdDetails(id: profileModel?.id ?? 0);
            }
          },
          child: Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: profileModel?.isDefault == 1
                  ? const BorderSide(
                      color: ColorsApp.mainBlue,
                      width: 2,
                    )
                  : BorderSide(
                      color: ColorsApp.gray,
                      width: 1,
                    ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: CircleAvatar(
                radius: 25.r,
                backgroundImage: NetworkImage("${profileModel?.profileImage}"),
              ),
              title: Text("${profileModel?.titleJob}"),
              subtitle: Text("${profileModel?.jobPosition}"),
              trailing: profileModel?.isDefault == 1
                  ? const Icon(
                      Icons.check_circle,
                      size: 30,
                      color: ColorsApp.mainBlue,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
