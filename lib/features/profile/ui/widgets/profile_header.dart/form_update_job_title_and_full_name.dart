import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/form_field_app_text.dart';
import '../../../data/models/profile_response_model.dart';
import '../../../logic/profile_cubit.dart';

class FormUpdateJobTitleAndFullName extends StatelessWidget {
  const FormUpdateJobTitleAndFullName({
    super.key,
    required this.profileData,
  });
  final ProfileData? profileData;

  @override
  Widget build(BuildContext context) {
    final cuibt = context.watch<ProfileCubit>();
    return Form(
      key: cuibt.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Name
          Text('Full Name', style: TextStyles.font16DarkBlackSemiBold),
          verticalSpace(8),
          AppTextFormField(
            controller: cuibt.fullNameController,
            keyboardType: TextInputType.name,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
            prefixIcon: Icon(
              Icons.person_2_outlined,
              color: ColorsApp.gray,
              size: 25.sp,
            ),
            hintText: 'Full Name',
            hintStyle: TextStyles.font14Gray,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Full Name';
              }
              return null;
            },
          ),
          verticalSpace(16),
          // Title Job
          Text('Title Job', style: TextStyles.font16DarkBlackSemiBold),
          verticalSpace(8),
          AppTextFormField(
            controller: cuibt.titleJobController,
            keyboardType: TextInputType.name,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
            prefixIcon: Icon(
              Icons.work_outline,
              color: ColorsApp.gray,
              size: 23.sp,
            ),
            hintText: 'Title Job',
            hintStyle: TextStyles.font14Gray,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Title Job';
              }
              return null;
            },
          ),
          verticalSpace(16),
          // Job Position
          Text('Job Position', style: TextStyles.font16DarkBlackSemiBold),
          verticalSpace(8),
          AppTextFormField(
            controller: cuibt.jobPositionController,
            keyboardType: TextInputType.name,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
            prefixIcon: Icon(
              Icons.poll_outlined,
              color: ColorsApp.gray,
              size: 23.sp,
            ),
            hintText: 'Job Position',
            hintStyle: TextStyles.font14Gray,
            validator: (value) {
              return null; // Optional field, no validation required
            },
          ),
          verticalSpace(40),
        ],
      ),
    );
  }
}