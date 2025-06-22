import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/profile/logic/profile_cubit.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../data/models/profile_response_model.dart';
import '../../logic/profile_state.dart';

class EditEducationScreen extends StatelessWidget {
  EditEducationScreen({super.key, this.education});

  final Education? education;

  final formKey = GlobalKey<FormState>();
  final schoolController = TextEditingController();
  final fieldOfStudyController = TextEditingController();
  final collegeController = TextEditingController();
  final degreeController = TextEditingController();
  final locationController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Education'),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          schoolController.text = education?.college ?? '';
          fieldOfStudyController.text = education?.fieldOfStudy ?? '';
          collegeController.text = education?.college ?? '';
          degreeController.text = education?.degree ?? '';
          locationController.text = education?.location ?? '';
          startDateController.text = education?.startDate ?? '';
          endDateController.text = education?.endDate ?? '';
          descriptionController.text = education?.description ?? '';

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('School*', style: TextStyles.font16DarkBlackSemiBold),
                    verticalSpace(8),
                    AppTextFormField(
                      controller: schoolController,
                      keyboardType: TextInputType.text,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                      prefixIcon: Icon(Icons.school_outlined,
                          color: ColorsApp.gray, size: 25.sp),
                      hintText: 'Ex:Cairo University',
                      hintStyle: TextStyles.font14Gray,
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your School'
                          : null,
                    ),
                    verticalSpace(16),
                    Text('Degree', style: TextStyles.font16DarkBlackSemiBold),
                    verticalSpace(8),
                    AppTextFormField(
                      controller: degreeController,
                      keyboardType: TextInputType.text,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                      prefixIcon: Icon(Icons.rotate_90_degrees_ccw,
                          color: ColorsApp.gray, size: 23.sp),
                      hintText: 'Ex: Bachelors',
                      hintStyle: TextStyles.font14Gray,
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your Degree'
                          : null,
                    ),
                    verticalSpace(16),
                    Text('Field of Study',
                        style: TextStyles.font16DarkBlackSemiBold),
                    verticalSpace(8),
                    AppTextFormField(
                      controller: fieldOfStudyController,
                      keyboardType: TextInputType.text,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                      prefixIcon: Icon(Icons.work_outline,
                          color: ColorsApp.gray, size: 23.sp),
                      hintText: 'Ex: Computer Science',
                      hintStyle: TextStyles.font14Gray,
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your Field of Study'
                          : null,
                    ),
                    verticalSpace(16),
                    Row(children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Start Date',
                                style: TextStyles.font16DarkBlackSemiBold),
                            verticalSpace(8),
                            AppTextFormField(
                              controller: startDateController,
                              keyboardType: TextInputType.text,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20.h),
                              prefixIcon: Icon(Icons.calendar_month_outlined,
                                  color: ColorsApp.gray, size: 23.sp),
                              hintText: 'Ex: 2020',
                              hintStyle: TextStyles.font14Gray,
                              validator: (value) => value?.isEmpty == true
                                  ? 'Please enter your Start Date'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('End Date',
                                style: TextStyles.font16DarkBlackSemiBold),
                            verticalSpace(8),
                            AppTextFormField(
                              controller: endDateController,
                              keyboardType: TextInputType.text,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20.h),
                              prefixIcon: Icon(Icons.calendar_month_outlined,
                                  color: ColorsApp.gray, size: 23.sp),
                              hintText: 'Ex: 2022',
                              hintStyle: TextStyles.font14Gray,
                              validator: (value) => value?.isEmpty == true
                                  ? 'Please enter your End Date'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ]),
                    verticalSpace(16),
                    Text('Location', style: TextStyles.font16DarkBlackSemiBold),
                    verticalSpace(8),
                    AppTextFormField(
                      controller: locationController,
                      keyboardType: TextInputType.text,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: ColorsApp.gray,
                      ),
                      hintText: 'Ex: Cairo, Egypt',
                      hintStyle: TextStyles.font14Gray,
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your Location'
                          : null,
                    ),
                    verticalSpace(16),
                    Text('Description',
                        style: TextStyles.font16DarkBlackSemiBold),
                    verticalSpace(8),
                    AppTextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 16.w),
                      // prefixIcon: Icon(Icons.description_outlined,
                      //     color: ColorsApp.gray, size: 23.sp),
                      hintText: 'Ex: Description',
                      hintStyle: TextStyles.font14Gray,
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your Description'
                          : null,
                    ),
                    verticalSpace(16),
                    // AppButton(title: 'Save', onPressed: (){}),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
