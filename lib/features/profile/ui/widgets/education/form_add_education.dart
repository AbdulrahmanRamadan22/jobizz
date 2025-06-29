import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/show_custom_date_picker.dart';
import '../../../logic/profile_cubit.dart';

class FormAddEducation extends StatelessWidget {
  const FormAddEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ProfileCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(8),
          AppTextFormField(
            labelText: 'School',
            controller: context.read<ProfileCubit>().schoolController,
            keyboardType: TextInputType.text,
            prefixIcon:
                Icon(Icons.school_outlined, color: ColorsApp.gray, size: 25.sp),
            hintText: 'Ex:Cairo University',
            validator: (value) =>
                value?.isEmpty == true ? 'Please enter your School' : null,
          ),
          verticalSpace(18),
          AppTextFormField(
            labelText: 'Degree',
            controller: context.read<ProfileCubit>().degreeController,
            keyboardType: TextInputType.text,
            prefixIcon: Icon(Icons.rotate_90_degrees_ccw,
                color: ColorsApp.gray, size: 23.sp),
            hintText: 'Ex: Bachelors',
            validator: (value) =>
                value?.isEmpty == true ? 'Please enter your Degree' : null,
          ),
          verticalSpace(18),
          AppTextFormField(
            labelText: 'Field of Study',
            controller: context.read<ProfileCubit>().fieldOfStudyController,
            keyboardType: TextInputType.text,
            prefixIcon:
                Icon(Icons.work_outline, color: ColorsApp.gray, size: 23.sp),
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
                  controller: context.read<ProfileCubit>().startDateController,
                  keyboardType: TextInputType.none,
                  // readOnly: true,
                  prefixIcon: Icon(Icons.calendar_month_outlined,
                      color: ColorsApp.gray, size: 23),
                  hintText: 'Ex: 2022-09-01',
                  onTap: () => showCustomDatePicker(
                    context,
                    controller:
                        context.read<ProfileCubit>().startDateController,
                    onDateSelected: () {
                      log('Start date selected: ${context.read<ProfileCubit>().startDateController.text}');
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
                  controller: context.read<ProfileCubit>().endDateController,
                  keyboardType: TextInputType.none,
                  // readOnly: true,
                  prefixIcon: Icon(Icons.calendar_month_outlined,
                      color: ColorsApp.gray, size: 23),
                  hintText: 'Ex: 2024-10-23',
                  onTap: () => showCustomDatePicker(
                    context,
                    controller: context.read<ProfileCubit>().endDateController,
                    firstDate: DateTime(2020), // Custom first date
                    lastDate: DateTime(2030), // Custom last date
                    onDateSelected: () {
                      log('End date selected: ${context.read<ProfileCubit>().endDateController.text}');
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
            controller: context.read<ProfileCubit>().locationController,
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
            controller: context.read<ProfileCubit>().endDateController,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            hintText: 'Ex: Description',
            validator: (value) => null, // Always returns null (no validation)
            // No validator needed
          ),
        ],
      ),
    );
  }
}
