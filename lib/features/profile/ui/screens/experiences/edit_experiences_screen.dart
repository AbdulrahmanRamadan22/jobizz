import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/profile/logic/experience/experience_cubit.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/button_app_text.dart';
import '../../../../../core/widgets/show_custom_date_picker.dart';
import '../../../../../core/widgets/showdialog_errors.dart';
import '../../../data/models/experience_request_model.dart';
import '../../../data/models/profile_response_model.dart';
import '../../../logic/experience/experience_state.dart';

class EditExperiencesScreen extends StatelessWidget {
  EditExperiencesScreen({super.key, this.experience});

  final Experience? experience;

  final formKey = GlobalKey<FormState>();
  final companyController = TextEditingController();
  final positionController = TextEditingController();
  // final jobTypeController = TextEditingController();
  final locationController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Experience'),
      ),
      body: BlocConsumer<ExperienceCubit, ExperienceState>(
        listenWhen: (previous, current) =>
            current is UpdateExperienceSuccess ||
            current is UpdateExperienceFailure,
        listener: (context, state) {
          state.whenOrNull(
            updateExperienceSuccess: () {
              Navigator.of(context).pop(true);
            },
            updateExperienceFailure: (error) {
              setupErrorState(context, error);
            },
          );
        },
        builder: (context, state) {
          companyController.text = experience?.company ?? '';
          positionController.text = experience?.position ?? '';
          // jobTypeController.text = experience?.jobType ?? '';
          locationController.text = experience?.location ?? '';
          startDateController.text = experience?.startDate ?? '';
          endDateController.text = experience?.endDate ?? '';
          descriptionController.text = experience?.description ?? '';

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
                      labelText: 'Company',
                      controller: companyController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.business_outlined,
                          color: ColorsApp.gray, size: 25.sp),
                      hintText: 'Ex: Google',
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your Company'
                          : null,
                    ),
                    verticalSpace(18),
                    AppTextFormField(
                      labelText: 'Position',
                      controller: positionController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.work_outline,
                          color: ColorsApp.gray, size: 23.sp),
                      hintText: 'Ex: Software Engineer',
                      validator: (value) => value?.isEmpty == true
                          ? 'Please enter your Position'
                          : null,
                    ),
                    // verticalSpace(18),
                    // AppTextFormField(
                    //   labelText: 'Job Type',
                    //   controller: jobTypeController,
                    //   keyboardType: TextInputType.text,
                    //   prefixIcon: Icon(Icons.category_outlined,
                    //       color: ColorsApp.gray, size: 23.sp),
                    //   hintText: 'Ex: Full-time',
                    //   validator: (value) => value?.isEmpty == true
                    //       ? 'Please enter your Job Type'
                    //       : null,
                    // ),
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
      context.read<ExperienceCubit>().updateExperience(
            experienceRequestModel: ExperienceRequestModel(
           
              company: companyController.text,
              position: positionController.text,
              // jobType: jobTypeController.text,
              location: locationController.text,
              startDate: startDateController.text,
              endDate: endDateController.text,
              description: descriptionController.text,
              isCurrent:  endDateController.text.isEmpty ? true : false,
            ),
            experienceId: experience?.id ?? 0,
          );
    }
  }
}