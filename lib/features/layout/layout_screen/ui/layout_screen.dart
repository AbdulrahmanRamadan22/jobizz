import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../drawer/drawer_wiget.dart';
import '../logic/cubit/layout_cubit.dart';
import '../logic/cubit/layout_state.dart';

class LayoutScreens extends StatelessWidget {
  const LayoutScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LayoutCubit>();

    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: cubit.scaffoldKey,
          drawer: DrawerWidget(), // Mark as const
          backgroundColor: ColorsApp.backGroundWhite,
          body: cubit.screensBottom[cubit.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorsApp.whiteColor,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorsApp.darkBlue,
            unselectedItemColor: ColorsApp.lightGray,
            showUnselectedLabels: false,
            currentIndex: cubit.currentIndex,
            onTap: cubit.changeIndex,
            selectedLabelStyle: TextStyles.font12DarkBlack,
            unselectedLabelStyle: TextStyles.font12Gray,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_rounded,
                  size: 30,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.apartment,
                  size: 30,
                ),
                label: 'Companies',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                ),
                label: 'Notification',
              ),
            ],
          ),
        );
      },
    );
  }
}
