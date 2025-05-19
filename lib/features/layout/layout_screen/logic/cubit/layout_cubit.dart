import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/di/dependancy_ingection.dart';
import 'package:jobizz/features/home/logic/cubit/home_cubit.dart';
import 'package:jobizz/features/layout/layout_screen/logic/cubit/layout_state.dart';

import '../../../../category/cubit/category_cubit.dart';
import '../../../../category/ui/screens/category_screen.dart';
import '../../../../companies/logic/cubit/company_cubit.dart';
import '../../../../companies/ui/screens/compaies_screen.dart';
import '../../../../home/ui/home_screen.dart';
import '../../../../notifications/ui/notifications_screen.dart.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();



  List<Widget> screensBottom = [
    BlocProvider<HomeCubit>.value(
      value: HomeCubit(getIt())..emitGetHomeData(),
      child: const HomeScreen(

      ),
    ),

    BlocProvider<CategoryCubit>(
      create: (context) => CategoryCubit(getIt())..getAllCategories(),
      child: const CategoryScreen(),
    ),

    BlocProvider(
      create: (context) => CompanyCubit(getIt())..getAllCompany(),
      child: CompaniesScreen(),
    ),
    // CategoryScreen(),

    // BlocProvider<CompanyCubit>.value(
    //   value: CompanyCubit(getIt())..getAllCompany(),
    //   child: const CompaniesScreen(),
    // ),

    const NotificationScreen(),

    // const MessagesScreen(),
    // const SavedScreen(),
    // const NotificationScreen(),
    // CategoryScreen()
  ];
  // required method to change the index

  void changeIndex(int index) {
    currentIndex = index;

   
    

    // emit state because we need to change the index
    emit(LayoutChangeBottomNavState());
  }
}
