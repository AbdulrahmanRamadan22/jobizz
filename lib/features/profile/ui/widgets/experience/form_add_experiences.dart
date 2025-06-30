import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/profile/logic/experience/experience_cubit.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/show_custom_date_picker.dart';

class FormAddExperiences extends StatelessWidget {
  const FormAddExperiences({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ExperienceCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(8),
          AppTextFormField(
            labelText: 'Company',
            controller: context.read<ExperienceCubit>().companyController,
            keyboardType: TextInputType.text,
            prefixIcon:
                Icon(Icons.business_outlined, color: ColorsApp.gray, size: 25.sp),
            hintText: 'Ex: Google Inc.',
            validator: (value) =>
                value?.isEmpty == true ? 'Please enter your Company' : null,
          ),
          verticalSpace(18),
          AppTextFormField(
            labelText: 'Job Title',
            controller: context.read<ExperienceCubit>().positionController,
            keyboardType: TextInputType.text,
            prefixIcon: Icon(Icons.work_outline,
                color: ColorsApp.gray, size: 23.sp),
            hintText: 'Ex: Software Engineer',
            validator: (value) =>
                value?.isEmpty == true ? 'Please enter your Job Title' : null,
          ),
          // verticalSpace(18),
          // AppTextFormField(
          //   labelText: 'Employment Type',
          //   controller: context.read<ExperienceCubit>().employmentTypeController,
          //   keyboardType: TextInputType.text,
          //   prefixIcon:
          //       Icon(Icons.assignment_outlined, color: ColorsApp.gray, size: 23.sp),
          //   hintText: 'Ex: Full-time, Part-time, Contract',
          //   validator: (value) => value?.isEmpty == true
          //       ? 'Please enter your Employment Type'
          //       : null,
          // ),
          verticalSpace(18),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  labelText: 'Start Date',
                  controller: context.read<ExperienceCubit>().startDateController,
                  keyboardType: TextInputType.none,
                  // readOnly: true,
                  prefixIcon: Icon(Icons.calendar_month_outlined,
                      color: ColorsApp.gray, size: 23),
                  hintText: 'Ex: 2022-09-01',
                  onTap: () => showCustomDatePicker(
                    context,
                    controller:
                        context.read<ExperienceCubit>().startDateController,
                    onDateSelected: () {
                      log('Start date selected: ${context.read<ExperienceCubit>().startDateController.text}');
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
                  controller: context.read<ExperienceCubit>().endDateController,
                  keyboardType: TextInputType.none,
                  // readOnly: true,
                  prefixIcon: Icon(Icons.calendar_month_outlined,
                      color: ColorsApp.gray, size: 23),
                  hintText: 'Ex: 2024-10-23',
                  onTap: () => showCustomDatePicker(
                    context,
                    controller: context.read<ExperienceCubit>().endDateController,
                    firstDate: DateTime(2020), // Custom first date
                    lastDate: DateTime(2030), // Custom last date
                    onDateSelected: () {
                      log('End date selected: ${context.read<ExperienceCubit>().endDateController.text}');
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
            controller: context.read<ExperienceCubit>().locationController,
            keyboardType: TextInputType.text,
            prefixIcon: Icon(
              Icons.location_on_outlined,
              color: ColorsApp.gray,
            ),
            hintText: 'Ex: Cairo, Egypt',
            validator: (value) =>
                value?.isEmpty == true ? 'Please enter your Location' : null,
          ),
          verticalSpace(18),
          AppTextFormField(
            labelText: 'Description (Optional)',
            controller: context.read<ExperienceCubit>().descriptionController,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            hintText: 'Ex: Responsibilities and achievements',
            validator: (value) => null, // Always returns null (no validation)
            // No validator needed
          ),
        ],
      ),
    );
  }
}