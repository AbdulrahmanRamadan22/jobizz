import 'package:flutter/material.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../home/data/model/home_response_model.dart';

class JobFondLength extends StatelessWidget {
  const JobFondLength({
    super.key,
    required this.jobs,
  });

  final List<Jop?>? jobs;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      title: Text(
        '${jobs?.length} Jobs Found',
        style: TextStyles.font166MainBlueMedium,
      ),
      elevation: 0,
      backgroundColor: ColorsApp.backGroundWhite,
      pinned: true,
      floating: true,
      centerTitle: false,
      snap: true,
      // flexibleSpace: SizedBox(height: 20),
    );
  }
}
