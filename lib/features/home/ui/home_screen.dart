import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/widgets/show_generic_search_dialog.dart';
import 'package:jobizz/features/home/data/model/home_response_model.dart';

import 'package:jobizz/features/home/ui/widgets/page_to_top.dart';
import 'package:jobizz/features/jobs/widgets/job_item.dart';

import '../../../core/helper/size_box.dart';
import '../../../core/theming/colors.dart';
import '../logic/cubit/home_cubit.dart';
import 'widgets/jobs_bloc_builder.dart';
import 'widgets/search_and_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundWhite,
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-----------------
            PageTopBar(),
            verticalSpace(10),
            //-----------------
            SearchAndFilter(
              onSearchTap: () {
                final homeCubit = context.read<HomeCubit>();
                final List<Jop> allJobsList = homeCubit.state.maybeWhen(
                  success: (homeResponse) {
                    final List<Jop?> combinedRawList = [
                      ...(homeResponse.data?.popular ?? []),
                      ...(homeResponse.data?.recommended ?? []),
                      ...(homeResponse.data?.trending ?? []),
                    ];
                    return combinedRawList.whereType<Jop>().toList();
                  },
                  orElse: () => [],
                );

                showGenericSearchDialog<Jop>(
                  context: context,
                  items: allJobsList,
                  searchFields: [
                    (jop) => jop.categoryName ?? '', // مسمى الوظيفة
                    (jop) => jop.companyName ?? '', // اسم الشركة
                    (jop) => jop.title ?? '',
                  ],
                  itemBuilder: (context, jop) {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0.w,
                          vertical: 7.h,
                        ),
                        child: JobItem(
                          jop: jop,
                        ));
                  },
                );
              },
            ),
            verticalSpace(9),
            //-----------------
            Expanded(
              child: RefreshIndicator(
                backgroundColor: ColorsApp.mainBlue,
                color: ColorsApp.whiteColor,
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  context.read<HomeCubit>().emitRefreshGetHomeData();
                },
                child: JobsBlocBuilder(),

    return  Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
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
                    context.read<HomeCubit>().emitRefreshGetHomeData();
                  },
                  child: JobsBlocBuilder(),
                ),

              ),
            ],
          ),
     
    );
  }
}
