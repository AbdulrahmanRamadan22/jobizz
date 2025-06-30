import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/profile/logic/experience/experience_cubit.dart';
import 'package:jobizz/features/profile/logic/experience/experience_state.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/button_app_text.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../../../../core/widgets/showdialog_errors.dart';
import '../../widgets/experience/form_add_experiences.dart';

class AddExperiencesScreen extends StatelessWidget {
  const AddExperiencesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Experience'),
      ),
      body: BlocConsumer<ExperienceCubit, ExperienceState>(
        listenWhen: (previous, current) =>
            current is AddExperienceSuccess ||
            current is AddExperienceFailure ||
            current is DeleteExperienceSuccess,
        listener: (context, state) {
          state.whenOrNull(
            addExperienceSuccess: () {
              showSnackBar(
                context,
                message: "Experience added successfully",
              );

              // context.read<ProfileCubit>().resetProfileData();
              context.pop();

              // Navigator.of(context).pop(true);
              // context.pushReplacementNamed(Routes.profileScreen);
              // context.read<ProfileCubit>().resetProfileData();
              // context.pop();
            },
            addExperienceFailure: (error) {
              setupErrorState(context, error);
            },
          );
        },
        builder: (BuildContext context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            child: CustomScrollView(
              slivers: <Widget>[
                if (state is AddExperienceLoading)
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
                      const FormAddExperiences(),
                      verticalSpace(40),
                      AppTextButton(
                        borderRadius: 8.r,
                        // buttonHeight: 56.h,
                        buttonText: 'Add Experience',
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
}


void validateThenDoProfileScreen(BuildContext context) {
  if (context.read<ExperienceCubit>().formKey.currentState!.validate()) {
    context.read<ExperienceCubit>().addExperience();
  }
}