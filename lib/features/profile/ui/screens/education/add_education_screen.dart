import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/profile/logic/education/education_cubit.dart';
import 'package:jobizz/features/profile/logic/education/education_state.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/button_app_text.dart';
import '../../../../../core/widgets/show_snack_bar.dart';

import '../../../../../core/widgets/showdialog_errors.dart';
import '../../widgets/education/form_add_education.dart';

class AddEducationScreen extends StatelessWidget {
  const AddEducationScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Education'),
      ),
      body: BlocConsumer<EducationCubit, EducationState>(
        listenWhen: (previous, current) =>
            current is AddEducationSuccess || current is AddEducationFailure || current is DeleteEducationSuccess,
        listener: (context, state) {
          state.whenOrNull(
            addEducationSuccess: () {
              showSnackBar(
                context,
                message: "Education added successfully",
              );

              // context.read<ProfileCubit>().resetProfileData();
              context.pop();

              // Navigator.of(context).pop(true);

              // context.pushReplacementNamed(Routes.profileScreen);
              // context.read<ProfileCubit>().resetProfileData();
              // context.pop();
            },
            addEducationFailure: (error) {
              setupErrorState(context, error);
            },
          );
        },
        builder: (BuildContext context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            child: CustomScrollView(
              slivers: <Widget>[
                if (state is AddEducationLoading)
                  SliverToBoxAdapter(
                      child: Column(
                    children: [
                      LinearProgressIndicator(),
                      verticalSpace(20),
                    ],
                  )),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      verticalSpace(20),
                      const FormAddEducation(),
                      verticalSpace(40),
                      AppTextButton(
                        borderRadius: 8.r,
                        // buttonHeight: 56.h,
                        buttonText: 'Add Education',
                        textStyle: TextStyles.font16White,
                        onPressed: () {
                          validateThenDoProfileScreen(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void validateThenDoProfileScreen(BuildContext context) {
    if (context.read<EducationCubit>().formKey.currentState!.validate()) {
      context.read<EducationCubit>().addEducation();
    }
  }
}
