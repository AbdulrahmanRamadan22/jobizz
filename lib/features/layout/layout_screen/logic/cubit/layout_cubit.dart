import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/di/dependancy_ingection.dart';
import 'package:jobizz/features/home/logic/cubit/home_cubit.dart';
import 'package:jobizz/features/layout/layout_screen/logic/cubit/layout_state.dart';

import '../../../../home/ui/home_screen.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> screensBottom = [
    BlocProvider<HomeCubit>(
      // create: HomeCubit(getIt())..emitGetHomeData(),
      create: (context) => HomeCubit(getIt())..emitGetHomeData(),
      child: HomeScreen(),
    ),
     Container(
      child: Center(
        child: Text("Search Screen"),
      ),
    ),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),

    // const MessagesScreen(),
    // const SavedScreen(),
    // const NotificationScreen(),
    // CategoryScreen()
  ];
  // required method to change the index

  void changeIndex(int index) {
    currentIndex = index;

    // if (index == 0) {
    //   HomeCubit(getIt()).emitGetHomeData();
    // }
    // emit state because we need to change the index
    emit(LayoutChangeBottomNavState());
  }
}
