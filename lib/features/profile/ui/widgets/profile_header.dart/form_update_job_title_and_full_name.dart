import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/form_field_app_text.dart';

class FormUpdateJobTitleAndFullName extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController titleJobController;
  final TextEditingController jobPositionController;

  const FormUpdateJobTitleAndFullName({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.titleJobController,
    required this.jobPositionController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Full Name', style: TextStyles.font16DarkBlackSemiBold),
          verticalSpace(8),
          AppTextFormField(
            controller: fullNameController,
            keyboardType: TextInputType.name,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
            prefixIcon: Icon(Icons.person_2_outlined, color: ColorsApp.gray, size: 25.sp),
            hintText: 'Full Name',
            hintStyle: TextStyles.font14Gray,
            validator: (value) => value?.isEmpty == true ? 'Please enter your Full Name' : null,
          ),
          verticalSpace(16),
          Text('Title Job', style: TextStyles.font16DarkBlackSemiBold),
          verticalSpace(8),
          AppTextFormField(
            controller: titleJobController,
            keyboardType: TextInputType.name,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
            prefixIcon: Icon(Icons.work_outline, color: ColorsApp.gray, size: 23.sp),
            hintText: 'Title Job',
            hintStyle: TextStyles.font14Gray,
            validator: (value) => value?.isEmpty == true ? 'Please enter your Title Job' : null,
          ),
          verticalSpace(16),
          Text('Job Position', style: TextStyles.font16DarkBlackSemiBold),
          verticalSpace(8),
          AppTextFormField(
            controller: jobPositionController,
            keyboardType: TextInputType.name,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
            prefixIcon: Icon(Icons.poll_outlined, color: ColorsApp.gray, size: 23.sp),
            hintText: 'Job Position',
            hintStyle: TextStyles.font14Gray,
            validator: (_) => null,
          ),
          verticalSpace(40),
        ],
      ),
    );
  }
}