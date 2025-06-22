import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/core/widgets/button_app_text.dart';

Future<void> showDialogDeleteItem(BuildContext context,
    {required String title,
    required String content,
    required void Function() onPressed}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        backgroundColor: ColorsApp.whiteColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        titlePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyles.font18DarkBlack,
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: ColorsApp.darkBlack,
                    size: 26.sp,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            Divider(
              color: ColorsApp.lightGray,
              thickness: 1,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(content, style: TextStyles.font16Black),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Divider(
                color: ColorsApp.lightGray,
                thickness: 1,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          // TextButton(
          //   child: const Text('Approve'),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          AppTextButton(
            buttonText: "Cancel",
            buttonWidth: double.infinity,
            onPressed: () {
              context.pop();
            },
            textStyle: TextStyles.font14MainBlue,
            backgroundColor: Colors.transparent,
            borderColor: ColorsApp.mainBlue,
            horizontalPadding: 20.w,
          ),
          horizontalSpace(4),
          AppTextButton(
            horizontalPadding: 20.w,
            buttonText: "Delete",
            onPressed: onPressed,
            buttonWidth: double.infinity,
            backgroundColor: ColorsApp.mainBlue,
            textStyle: TextStyles.font14White,
            borderColor: ColorsApp.mainBlue,
          ),
        ],
      );
    },
  );
}
