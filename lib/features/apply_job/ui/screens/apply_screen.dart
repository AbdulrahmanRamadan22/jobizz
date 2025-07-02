import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/apply_job/ui/widgets/card_select_company.dart';
import 'package:jobizz/features/apply_job/ui/widgets/grid_view_select_profile.dart';
import 'package:jobizz/features/apply_job/ui/widgets/grid_view_select_resume.dart';
import 'package:jobizz/features/apply_job/ui/widgets/text_form_and_upload_pdf.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';
import '../../../jobs/data/models/job.dart';
import '../../../profile/logic/resume/resume_cubit.dart';
import '../../../profile/logic/resume/resume_state.dart';

class ApplyScreen extends StatelessWidget {
  final Job? job;

  const ApplyScreen({super.key, this.job});

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
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardSelectCompany(
                    job: job,
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
                  SizedBox(
                    height: 80.h,
                    child: GridViewSelectResume(),
                  ),
                  verticalSpace(24),
                  TextFormAndUploadPdf(),
                  verticalSpace(24),
                  AppTextButton(
                    borderRadius: 5.r,
                    buttonHeight: 62.h,
                    buttonText: 'Apply',
                    textStyle: TextStyles.font16White,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.applySuccessScreen);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
