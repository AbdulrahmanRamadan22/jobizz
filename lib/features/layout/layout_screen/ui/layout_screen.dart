import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/internet_connection_service.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/no_internet_connection.dart';
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
  void dispose() {
    super.dispose();
    _connectionStream.drain();

  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LayoutCubit>();
    return isConnected
        ? BlocBuilder<LayoutCubit, LayoutState>(
            builder: (context, state) {
              return Scaffold(
                key: cubit.scaffoldKey,
                drawer: const DrawerWidget(), // Added const for optimization
                backgroundColor: ColorsApp.backGroundWhite,
                body: SafeArea(
                  child: cubit.screensBottom[cubit.currentIndex],
                ),
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
        : NoInternetConnection();
  }
}