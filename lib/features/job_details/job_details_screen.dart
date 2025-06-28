import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/core/widgets/button_app_text.dart';
import 'package:jobizz/features/home/data/model/home_response_model.dart';
import 'package:jobizz/features/job_details/widgets/stack_image_title_buttons.dart';
import 'package:jobizz/features/job_details/widgets/tab_bar_view.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({
    super.key,
    this.job,
  });
  final Jop? job;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StackImageTitleButtons(
              job: job,
            ),

            verticalSpace(36),
            TabBar(
              mouseCursor: SystemMouseCursors.click,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: ColorsApp.black,
              labelStyle: TextStyles.font14Black,
              padding: EdgeInsets.zero,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              unselectedLabelColor: ColorsApp.lightBlueGray,
              tabs: [
                Tab(
                  child: Text(
                    'Description',
                  ),
                ),
                Tab(
                  child: Text(
                    'Requirement',
                  ),
                ),
                Tab(
                  child: Text('Benefits'),
                ),
              ],
            ),
            // tab bar view design
            TabBarViewDesign(
              job: job,
            ),
            verticalSpace(8),
            AppTextButton(
              borderRadius: 5.r,
              buttonWidth: 327.w,
              buttonHeight: 56.h,
              buttonText: 'Apply Now',
              textStyle: TextStyles.font16White,
              onPressed: () {
                //   context.pushNamed(Routes.applyScreen);
              },
            ),
            verticalSpace(8)
          ],
        ),
      ),
    );
  }
}
