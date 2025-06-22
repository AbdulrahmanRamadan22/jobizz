import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/di/dependancy_ingection.dart';
import 'package:jobizz/features/home/logic/cubit/home_cubit.dart';
import 'package:jobizz/features/layout/layout_screen/logic/cubit/layout_state.dart';
import 'package:jobizz/features/saved_jobs/cubit/saved_cubit.dart';

import '../../../../bot_chat/ui/chat_bot_screen.dart';
import '../../../../category/cubit/category_cubit.dart';
import '../../../../category/ui/screens/category_screen.dart';
import '../../../../companies/logic/cubit/company_cubit.dart';
import '../../../../companies/ui/screens/compaies_screen.dart';
import '../../../../home/ui/home_screen.dart';
import '../../../../notifications/ui/notifications_screen.dart.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState()) {
    _initializeCubits();
  }
  // static LayoutCubit get(context) => BlocProvider.of(context);

  // Instantiate Cubits as properties to ensure single instances
  final HomeCubit homeCubit = HomeCubit(getIt());
  final CategoryCubit categoryCubit = CategoryCubit(getIt());
  final CompanyCubit companyCubit = CompanyCubit(getIt());
  final SavedCubit savedCubit = SavedCubit(getIt());

  int currentIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late final List<Widget> screensBottom = [
    // BlocProvider.value(
    //   value: homeCubit,
    //   child: const HomeScreen(),
    // ),
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: homeCubit),
        BlocProvider.value(value: savedCubit),
      ],
      child: const HomeScreen(),
    ),

    BlocProvider.value(
      value: categoryCubit,
      child: const CategoryScreen(),
    ),

    BlocProvider.value(
      value: companyCubit,
      child: CompaniesScreen(),
    ),
    // CategoryScreen(),

    const GeminiChatScreen(),

    const NotificationScreen(),

    // const MessagesScreen(),
    // const SavedScreen(),
    // const NotificationScreen(),
    // CategoryScreen()
  ];
  void _initializeCubits() {
    // Fetch initial data for home screen
    homeCubit.emitGetHomeData();
  }
  // required method to change the index

  void changeIndex(int index) {
    currentIndex = index;

    if (index == 0) {
      homeCubit.emitGetHomeData();
    } else if (index == 1) {
      categoryCubit.getAllCategories();
    } else if (index == 2) {
      companyCubit.getAllCompany();
    }

    // emit state because we need to change the index
    emit(LayoutChangeBottomNavState());
  }
}
