import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/profile/logic/profile_cubit.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/button_app_text.dart';
import '../../../../../core/widgets/show_custom_date_picker.dart';
import '../../../../../core/widgets/showdialog_errors.dart';
import '../../../data/models/profile_response_model.dart';
import '../../../logic/profile_state.dart';

class EditEducationScreen extends StatelessWidget {
  EditEducationScreen({super.key, this.education});

  final Education? education;

  final formKey = GlobalKey<FormState>();
  final schoolController = TextEditingController();
  final fieldOfStudyController = TextEditingController();
  // final collegeController = TextEditingController();
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
        listenWhen: (previous, current) =>
            current is UpdateEducationSuccess ||
            current is UpdateEducationFailure,

        listener: (context, state) {
          state.whenOrNull(
            updateEducationSuccess: () {
              Navigator.of(context).pop(true);
            },
            updateEducationFailure: (error) {
              setupErrorState(context, error);
            },
          );
        },
        builder: (context, state) {
          schoolController.text = education?.college ?? '';
          fieldOfStudyController.text = education?.fieldOfStudy ?? '';
          // collegeController.text = education?.college ?? '';
          degreeController.text = education?.degree ?? '';
          locationController.text = education?.location ?? '';
          startDateController.text = education?.startDate ?? '';
          endDateController.text = education?.endDate ?? '';
          descriptionController.text = education?.description ?? '';

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(8),
                    AppTextFormField(
                      labelText: 'School',
                      controller: schoolController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.school_outlined,
                          color: ColorsApp.gray, size: 25.sp),
                      hintText: 'Ex:Cairo University',
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your School'
                          : null,
                    ),
                    verticalSpace(18),
                    AppTextFormField(
                      labelText: 'Degree',
                      controller: degreeController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.rotate_90_degrees_ccw,
                          color: ColorsApp.gray, size: 23.sp),
                      hintText: 'Ex: Bachelors',
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your Degree'
                          : null,
                    ),
                    verticalSpace(18),
                    AppTextFormField(
                      labelText: 'Field of Study',
                      controller: fieldOfStudyController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.work_outline,
                          color: ColorsApp.gray, size: 23.sp),
                      hintText: 'Ex: Computer Science',
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your Field of Study'
                          : null,
                    ),
                    verticalSpace(18),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextFormField(
                            labelText: 'Start Date',
                            controller: startDateController,
                            keyboardType: TextInputType.none,
                            // readOnly: true,
                            prefixIcon: Icon(Icons.calendar_month_outlined,
                                color: ColorsApp.gray, size: 23),
                            hintText: 'Ex: 2022-09-01',
                            onTap: () => showCustomDatePicker(
                              context,
                              controller: startDateController,
                              onDateSelected: () {
                                print(
                                    'Start date selected: ${startDateController.text}');
                              },
                            ),
                            validator: (value) => value?.isEmpty == true
                                ? 'Please enter your Start Date'
                                : null,
                          ),
                        ),
                        horizontalSpace(18),
                        Expanded(
                          child: AppTextFormField(
                            labelText: 'End Date',
                            controller: endDateController,
                            keyboardType: TextInputType.none,
                            // readOnly: true,
                            prefixIcon: Icon(Icons.calendar_month_outlined,
                                color: ColorsApp.gray, size: 23),
                            hintText: 'Ex: 2024-10-23',
                            onTap: () => showCustomDatePicker(
                              context,
                              controller: endDateController,
                              firstDate: DateTime(2020), // Custom first date
                              lastDate: DateTime(2030), // Custom last date
                              onDateSelected: () {
                                print(
                                    'End date selected: ${endDateController.text}');
                              },
                            ),
                            validator: (value) {},
                          ),
                        ),
                      ],
                    ),
                   
                    verticalSpace(18),
                    AppTextFormField(
                      labelText: 'Location',
                      controller: locationController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: ColorsApp.gray,
                      ),
                      hintText: 'Ex: Cairo, Egypt',
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your Location'
                          : null,
                    ),
                    verticalSpace(18),
                    AppTextFormField(
                      labelText: 'Description (Optional)',
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      hintText: 'Ex: Description',
                      validator: (value) =>
                          null, // Always returns null (no validation)
                      // No validator needed
                    ),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Save',
                      onPressed: () {
                        validateThenDoProfileScreen(context);
                      },
                      textStyle: TextStyles.font16White,
                      borderRadius: 8,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void validateThenDoProfileScreen(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<ProfileCubit>().updateEducation(
            education: Education(
              id: education?.id,
              college: schoolController.text,
              fieldOfStudy: fieldOfStudyController.text,
              degree: degreeController.text,
              location: locationController.text,
              startDate: startDateController.text,
              endDate: endDateController.text,
              description: descriptionController.text,
              isCurrent: true,
            ),
            educationId: education?.id ?? 0,
          );
    }
  }
}
















