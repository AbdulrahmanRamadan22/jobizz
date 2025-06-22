import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/custom_ show_dialog.dart';
import '../../../data/models/profile_response_model.dart';
import '../build_menu_item.dart';

class BuildEnhancedMenuEducation extends StatefulWidget {
  const BuildEnhancedMenuEducation({super.key, this.education});
  final Education? education;

  @override
  State<BuildEnhancedMenuEducation> createState() =>
      _BuildEnhancedMenuEducationState();
}

class _BuildEnhancedMenuEducationState
    extends State<BuildEnhancedMenuEducation> {
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
              context.pushNamed(Routes.editEducationScreen,
                  arguments: widget.education);

              // Handle edit action
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
          buildMenuItem(
            icon: Icons.delete_outline,
            text: 'Delete',
            onPressed: () {
              showDialogDeleteItem(
                context,
                title: "Delete Education",
                content:
                    "Are you sure you want to delete your ${widget.education?.college} education?",
                onPressed: () {
                  // Handle delete action
                },
              );
            },
            color: Colors.red,
            isDestructive: true,
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
