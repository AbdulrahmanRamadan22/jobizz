import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/home/ui/widgets/page_to_top.dart';

import '../../../core/helper/size_box.dart';
import '../../../core/theming/colors.dart';
import '../../layout/drawer/drawer_wiget.dart';
import '../logic/cubit/home_cubit.dart';
import 'widgets/jobs_bloc_builder.dart';
import 'widgets/search_and_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundWhite,
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTopBar(),
            verticalSpace(10),
            SearchAndFilter(),
            verticalSpace(9),
            Expanded(
              child: RefreshIndicator(
                backgroundColor: ColorsApp.mainBlue,
                color: ColorsApp.whiteColor,
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  // HomeCubit(getIt()).emitGetHomeData();

                  // ignore: use_build_context_synchronously
                  context.read<HomeCubit>().emitGetHomeData();
                },
                child: JobsBlocBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
