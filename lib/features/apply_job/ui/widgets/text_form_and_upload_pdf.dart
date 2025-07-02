import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';


class TextFormAndUploadPdf extends StatelessWidget {
  const TextFormAndUploadPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Cover Letter', style: TextStyles.font16Black),
              TextSpan(text: ' (Optional)', style: TextStyles.font14Gray),
            ],
          ),
        ),
        verticalSpace(16),
        // cover letter text field ..
        Row(
          children: [
            Container(
              width: 235.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: ColorsApp.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: AppTextFormField(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle: TextStyles.font14Gray,
                hintText: 'Write a cover letter......',
                backgroundColor: Colors.transparent,
                validator: (value) {},
                contentPadding:
                    EdgeInsets.symmetric(vertical: 18.h, horizontal: 14.w),
              ),
            ),
            horizontalSpace(10),
            // upload pdf button ..
            GestureDetector(
              onTap: () {
                print('جااري تحميل الملف ');
              },
              child: Container(
                width: 80.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: ColorsApp.whiteColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      color: ColorsApp.mainBlue,
                      size: 25.r,
                    ),
                    Text(
                      'Upload',
                      style: TextStyles.font10MainBlue,
                    ),
                    Text(
                      'Pdf',
                      style: TextStyles.font10MainBlue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}