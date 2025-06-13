import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/colors.dart';
import 'list_view_drawer.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsApp.backGroundWhite,
      semanticLabel: 'Drawer',
      elevation: 0,
      width: 300.w,
      child: ListViewDrawer(
      ),
    );
  }
}
