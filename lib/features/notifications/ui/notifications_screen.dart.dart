import 'package:flutter/material.dart';
import 'package:jobizz/features/notifications/ui/widgets/sliver_list_new_active.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/row_text_and_see_all.dart';
import 'widgets/sliver_list_app.dart';
import 'widgets/sliver_list_inter_view.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backGroundWhite,
        title: Text(
          'Notification',
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: [
            // New activity قسم
            SliverToBoxAdapter(
              child: Text(
                'New activity',
                style: TextStyles.font14Black,
              ),
            ),
            SliverListNewActive(),
            // Applications قسم
            SliverToBoxAdapter(
              child: RowTextAndSeeAll(
                text: 'Applications',
                onPressed: () {},
              ),
            ),
            SliverListApp(),
            // Inter view قسم
            SliverToBoxAdapter(
              child: RowTextAndSeeAll(
                text: 'Interview',
                onPressed: () {},
              ),
            ),
            SliverListInterView()
          ],
        ),
      ),
    );
  }
}
