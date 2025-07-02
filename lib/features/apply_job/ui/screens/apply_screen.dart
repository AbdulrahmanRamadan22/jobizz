import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/apply_job/ui/widgets/card_select_company.dart';
import 'package:jobizz/features/apply_job/ui/widgets/grid_view_select_profile.dart';
import 'package:jobizz/features/apply_job/ui/widgets/grid_view_select_resume.dart';
import 'package:jobizz/features/apply_job/ui/widgets/text_form_and_upload_pdf.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';
import '../../../../core/widgets/showdialog_loadin.dart';
import '../../../jobs/data/models/job.dart';
import '../../../profile/logic/resume/resume_cubit.dart';
import '../../../profile/logic/resume/resume_state.dart';

class ApplyScreen extends StatefulWidget {
  final Job? job;

  const ApplyScreen({super.key, this.job});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  int? selectedResumeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Apply',
          style: TextStyles.font16Black,
        ),
      ),
      body: BlocConsumer<ResumeCubit, ResumeState>(
        listener: (context, state) {
          // Handle state changes like success/error
          if (state is ApplicationApplySuccess) {
            context.pop();
            context.pushNamed(Routes.applySuccessScreen);
            // Navigator.pushNamed(context, Routes.applySuccessScreen);
          }

          if (state is ApplicationApplyLoading) {
            showDialogLoading(context);
          }

          if (state is ApplicationApplyFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Failed to submit application: ${state.apiErrorModel.message ?? 'Unknown error'}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardSelectCompany(
                    job: widget.job,
                  ),
                  verticalSpace(24),
                  Text('Select a profile', style: TextStyles.font16Black),
                  verticalSpace(16),
                  SizedBox(
                    height: 150.h,
                    child: GridViewSelectProfile(),
                  ),
                  verticalSpace(32),
                  Text('Select a resume', style: TextStyles.font16Black),
                  verticalSpace(16),
                  GridViewSelectResume(
                    onResumeSelected: (resumeId) {
                      setState(() {
                        selectedResumeId = resumeId;
                      });
                    },
                  ),
                  verticalSpace(24),
                  TextFormAndUploadPdf(),
                  verticalSpace(12),
                  AppTextButton(
                      borderRadius: 5.r,
                      buttonHeight: 55.h,
                      buttonText: "Apply",
                      textStyle: TextStyles.font16White,
                      onPressed: () {
                        _validateAndSubmitApplication(context);
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _validateAndSubmitApplication(BuildContext context) {
    // Validate that both profile and resume are selected
    if (selectedResumeId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a resume'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // if (selectedProfileId == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Please select a profile'),
    //       backgroundColor: Colors.orange,
    //     ),
    //   );
    //   return;
    // }

    // if (widget.job?.id == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Job information is missing'),
    //       backgroundColor: Colors.red,
    //     ),
    //   );
    //   return;
    // }

    // Submit the application
    context.read<ResumeCubit>().addApplication(
          jobId: widget.job!.id,
          cvId: selectedResumeId!,
          // if needed
        );
  }
}
