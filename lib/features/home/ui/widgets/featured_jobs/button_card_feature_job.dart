import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class ButtonCardFeaturedJob extends StatelessWidget {
  const ButtonCardFeaturedJob({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: ColorsApp.lightBlueGray.withValues(alpha: 0.2),
      ),
      child: Text(title.split(" ").first, style: TextStyles.font13White),
    );
  }
}
