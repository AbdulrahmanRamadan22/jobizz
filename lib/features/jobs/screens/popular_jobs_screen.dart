import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobizz/core/theming/colors.dart';

import '../../home/data/model/home_response_model.dart';
import '../widgets/grid_view_jobs.dart';

class PopularJobsScreen extends StatelessWidget {
  const PopularJobsScreen({super.key, this.popularJobs});

  final List<Jop?>? popularJobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Jobs'),
        centerTitle: true,
        backgroundColor: ColorsApp.whiteColor,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
            sliver: GridViewJobs(
              Jobs: popularJobs,
            ),
          ),
        ],
      ),
    );
  }
}
