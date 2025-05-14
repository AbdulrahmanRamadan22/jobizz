import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/size_box.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import 'widgets/list_view_builder_card.dart';
import 'widgets/list_view_separated_buttons.dart';

class SavedJobsScreen extends StatelessWidget {
  const SavedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,

        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
        centerTitle: true,
        title: Text(
          'Saved Jobs',
          // style: TextStyles.font16Black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You saved 48 Jobs 👍',
              style: TextStyles.font22BlackBold,
            ),
            verticalSpace(36),
            const ListViewSeparated(),
            verticalSpace(24),
            ListViewBuilderCard(),
          ],
        ),
      ),
    );
  }
}
