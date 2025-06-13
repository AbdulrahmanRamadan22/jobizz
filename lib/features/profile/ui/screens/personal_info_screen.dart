import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';
import '../../../../core/widgets/showdialog_errors.dart';
import '../../data/models/profile_response_model.dart';
import '../../logic/profile_cubit.dart';
import '../../logic/profile_state.dart';
import '../widgets/profile_header.dart/form_update_job_title_and_full_name.dart';
import '../widgets/profile_header.dart/stack_profile_image.dart';

class PersonalInfoScreen extends StatefulWidget {
  final ProfileData? profileData;

  const PersonalInfoScreen({super.key, this.profileData});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfoScreen> {
  late TextEditingController fullNameController;
  late TextEditingController titleJobController;
  late TextEditingController jobPositionController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fullNameController =
        TextEditingController(text: widget.profileData?.fullName ?? '');
    titleJobController =
        TextEditingController(text: widget.profileData?.titleJob ?? '');
    jobPositionController =
        TextEditingController(text: widget.profileData?.jobPosition ?? '');
  }

  @override
  void dispose() {
    fullNameController.dispose();
    titleJobController.dispose();
    jobPositionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Info')),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listenWhen: (previous, current) =>
            current is UpdateGeneralProfileDataSuccess ||
            current is UpdateGeneralProfileDataFailure,
        listener: (context, state) {
          state.whenOrNull(
            updateGeneralProfileDataSuccess: (data) {
              Navigator.of(context).pop(true);
            },
            updateGeneralProfileDataFailure: (error) {
              setupErrorState(context, error);
            },
          );
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (state is UpdateGeneralProfileDataLoading)
                    LinearProgressIndicator(
                      color: ColorsApp.mainBlue,
                      backgroundColor: ColorsApp.lightGray,
                    ),
                  verticalSpace(20),
                  StackProfileImage(profileData: widget.profileData),
                  verticalSpace(30),
                  FormUpdateJobTitleAndFullName(
                    formKey: formKey,
                    fullNameController: fullNameController,
                    titleJobController: titleJobController,
                    jobPositionController: jobPositionController,
                  ),
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
            ),
          );
        },
      ),
    );
  }

  void validateThenDoProfileScreen(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<ProfileCubit>().updateGeneralProfileData(
            fullName: fullNameController.text,
            titleJob: titleJobController.text,
            jobPosition: jobPositionController.text,
          );
    }
  }
}
