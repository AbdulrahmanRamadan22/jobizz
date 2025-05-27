import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/networking/internet_connection_service.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../drawer/drawer_wiget.dart';
import '../logic/cubit/layout_cubit.dart';
import '../logic/cubit/layout_state.dart';

class LayoutScreens extends StatefulWidget {
  const LayoutScreens({super.key});

  @override
  State<LayoutScreens> createState() => _LayoutScreensState();
}

class _LayoutScreensState extends State<LayoutScreens> {
  bool isConnected = true;
  late final Stream<bool> _connectionStream;

  @override
  void initState() {
    super.initState();
    _connectionStream = InternetConnectionService().connectionChange;
    isConnected = InternetConnectionService().hasConnection;

    _connectionStream.listen((status) {
      setState(() {
        isConnected = status;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LayoutCubit>();

    return isConnected
        ? BlocBuilder<LayoutCubit, LayoutState>(
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
                        Icons.chat_bubble,
                        size: 30,
                      ),
                      label: 'ChatBot',
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
          )
        : Scaffold(
            backgroundColor: ColorsApp.whiteColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/offline.json',
                    width: double.infinity,

                    // height: 250,
                    fit: BoxFit.cover,
                  ),
                  verticalSpace(40),
                  Text('No Internet Connection',
                      style: TextStyles.font22BlackBold),
                  verticalSpace(20),
                  Text(
                    'Please check your internet connection and try again.',
                    style: TextStyles.font14Gray,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
  }
}
