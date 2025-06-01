import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';
import '../../../../core/widgets/showdialog_errors.dart';
import '../../data/models/profile_response_model.dart';
import '../../logic/profile_cubit.dart';
import '../../logic/profile_state.dart';
import '../widgets/profile_header.dart/form_update_job_title_and_full_name.dart';

class JobTitleAndFullNameUpdateScreen extends StatefulWidget {
  final ProfileData? profileData;

  const JobTitleAndFullNameUpdateScreen({super.key, this.profileData});

  @override
  State<JobTitleAndFullNameUpdateScreen> createState() => _JobTitleAndFullNameUpdateScreenState();
}

class _JobTitleAndFullNameUpdateScreenState extends State<JobTitleAndFullNameUpdateScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize controllers with profileData when the screen is first built
    context.read<ProfileCubit>().initControllers(widget.profileData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Updated')),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listenWhen: (previous, current) =>
            current is UpdateGeneralProfileDataSuccess ||
            current is UpdateGeneralProfileDataFailure,

          
        listener: (context, state) {
          state.whenOrNull(
            updateGeneralProfileDataSuccess: (data) {
         
              Navigator.of(context).pop(true);
              // context.pushNamed(Routes.layoutScreen);
            },
            updateGeneralProfileDataFailure: (error) {
              setupErrorState(context, error);
            },
          );
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            child: Column(
              children: [
                if (state is UpdateGeneralProfileDataLoading)
                  LinearProgressIndicator(
                    color: ColorsApp.mainBlue,
                    backgroundColor: ColorsApp.lightGray,
                  ),
                verticalSpace(10),
                FormUpdateJobTitleAndFullName(profileData: widget.profileData),
                AppTextButton(
                  borderRadius: 5.r,
                  buttonHeight: 55.h,
                  buttonText: 'Save',
                  textStyle: TextStyles.font16White,
                  onPressed: () {
                    validateThenDoProfileScreen(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void validateThenDoProfileScreen(BuildContext context) {
    if (context.read<ProfileCubit>().formKey.currentState!.validate()) {
      context.read<ProfileCubit>().updateGeneralProfileData();
    }
  }
}