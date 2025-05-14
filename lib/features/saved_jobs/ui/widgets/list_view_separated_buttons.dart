import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';

class ListViewSeparated extends StatefulWidget {
  const ListViewSeparated({super.key});

  @override
  State<ListViewSeparated> createState() => _ListViewSeparatedState();
}

class _ListViewSeparatedState extends State<ListViewSeparated> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;

          return AppTextButton(
            backgroundColor:
                isSelected ? ColorsApp.darkBlue : Colors.transparent,
            borderRadius: 25.r,
            buttonWidth:double.infinity,
            buttonText: 'Developer ',
            borderColor: isSelected ? Colors.transparent : ColorsApp.gray,
            textStyle:
                isSelected ? TextStyles.font14White : TextStyles.font14Gray,
            onPressed: () {
              setState(
                () {
                  selectedIndex = index;
                },
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10.w);
        },
      ),
    );
  }
}
