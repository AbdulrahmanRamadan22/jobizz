import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/showdialog_errors.dart';
import '../../../../core/widgets/showdialog_loadin.dart';
import '../../data/models/profile_response_model.dart';
import '../../logic/switch_profile_cubit.dart';
import '../../logic/switch_profile_state.dart';

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
