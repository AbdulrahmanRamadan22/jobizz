import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/profile/logic/experience/experience_cubit.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/custom_ show_dialog.dart';
import '../../../../../core/widgets/showdialog_errors.dart';
import '../../../../../core/widgets/showdialog_loadin.dart';

import '../../../data/models/profile_response_model.dart';
import '../../../logic/experience/experience_state.dart';
import '../build_menu_item.dart';

class BuildEnhancedMenuExperience extends StatefulWidget {
  const BuildEnhancedMenuExperience({super.key, this.experience});
  final Experience? experience;

  @override
  State<BuildEnhancedMenuExperience> createState() =>
      _BuildEnhancedMenuExperienceState();
}

class _BuildEnhancedMenuExperienceState
    extends State<BuildEnhancedMenuExperience> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: MenuAnchor(
        alignmentOffset: Offset(-70.w, 4.h),
        style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(ColorsApp.whiteColor),
          elevation: WidgetStatePropertyAll(8),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(
                color: ColorsApp.lightGray.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
          ),
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8.h)),
        ),
        childFocusNode: _buttonFocusNode,
        menuChildren: <Widget>[
          buildMenuItem(
            icon: Icons.edit_outlined,
            text: 'Edit',
            onPressed: () {
              context.pushNamed(Routes.editExperienceScreen,
                  arguments: widget.experience);
            },
            color: ColorsApp.mainBlue,
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[200],
            indent: 16.w,
            endIndent: 16.w,
          ),
          BlocListener<ExperienceCubit, ExperienceState>(
            listenWhen: (previous, current) =>
                current is DeleteExperienceFailure ||
                current is DeleteExperienceSuccess ||
                current is DeleteExperienceLoading,
            listener: (context, state) {
              state.whenOrNull(
                deleteExperienceSuccess: () {
                  // Close the loading dialog first

                  // Show success message
            

                  context.pop();

                  // Refresh the experience list
                  // Navigator.of(context).pop();
                },
                deleteExperienceFailure: (error) {
                  // Close the loading dialog
                  Navigator.of(context).pop();
                  // Show error dialog
                  setupErrorState(context, error);
                },
                deleteExperienceLoading: () {
                  showDialogLoading(context);
                },
              );
            },
            child: buildMenuItem(
              icon: Icons.delete_outline,
              text: 'Delete',
              onPressed: () {
                showDialogDeleteItem(
                  context,
                  title: "Delete Experience",
                  content:
                      "Are you sure you want to delete your ${widget.experience?.position} experience at ${widget.experience?.company}?",
                  onPressed: () {
                    // Close the delete confirmation dialog first
                    Navigator.of(context).pop();

                    // Then trigger the delete action
                    context.read<ExperienceCubit>().deleteExperience(
                        experienceId: widget.experience?.id ?? 0);
                  },
                );
              },
              color: Colors.red,
              isDestructive: true,
            ),
          ),
        ],
        builder: (_, MenuController controller, Widget? child) {
          return InkWell(
            onTap: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: EdgeInsets.all(8.w),
              child: Icon(
                Icons.more_vert_rounded,
                size: 20.sp,
                color: Colors.grey[600],
              ),
            ),
          );
        },
      ),
    );
  }
}