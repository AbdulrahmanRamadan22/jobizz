import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../../../../core/di/dependancy_ingection.dart';
import '../../../../core/networking/api_services.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/showdialog_errors.dart';
import '../../../../core/widgets/showdialog_loadin.dart';
import '../../../profile/data/models/profile_response_model.dart';
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
          profileDetailsByIdSuccess: (profileResponse) async {
            await _handleProfileSwitchSuccess(context, profileResponse);
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

  Future<void> _handleProfileSwitchSuccess(
      BuildContext context, ProfileResponseModel profileResponse) async {
    context.read<SwitchProfileCubit>().isFirstLoad = false;
    context.pop();
    // Ensure initialRoute is set for layout screen
    await SharedPrefHelper.saveData(
      key: SharedPrefKeys.initialRoute,
      value: Routes.layoutScreen,
    );
    debugPrint(
        '🤞 SwitchProfileItem: Set initialRoute to ${Routes.layoutScreen}');
    // // Delay to ensure SharedPreferences commit
    // await Future.delayed(const Duration(milliseconds: 100));


    // Check if widget is still mounted
    if (context.mounted) {
      // Re-register all dependencies
      debugPrint('🤞 SwitchProfileItem: Initiating Phoenix.rebirth');
      Phoenix.rebirth(context);
    } else {
      debugPrint(
          '🤞 SwitchProfileItem: Widget not mounted, skipping Phoenix.rebirth');
    }
  }
}
