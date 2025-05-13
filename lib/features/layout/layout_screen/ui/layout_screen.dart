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
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final cubit = context.read<LayoutCubit>();

        return Scaffold(
          drawer: const DrawerWidget(), // Mark as const
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
                activeIcon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.email,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.email,
                  size: 30,
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.bookmark,
                  size: 30,
                ),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.notifications,
                  size: 30,
                ),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_rounded,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.category_rounded,
                  size: 30,
                ),
                label: 'Category',
              ),
            ],
          ),
        );
      },
    );
  }
}
