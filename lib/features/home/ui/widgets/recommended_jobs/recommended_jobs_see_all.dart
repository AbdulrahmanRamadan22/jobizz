import 'package:flutter/material.dart';

import '../../../../../core/widgets/row_text_and_see_all.dart';

class RecommendedJobsSeeAll extends StatelessWidget {
  const RecommendedJobsSeeAll({super.key, required this.onPressed});

 final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RowTextAndSeeAll(
      onPressed:onPressed,
      text: 'Recommended Jobs',
    );
  }
}
