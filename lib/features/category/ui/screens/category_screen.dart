import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../widget/category_bloc_builder.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: ColorsApp.backGroundWhite,
    
        title: Text('Category'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 20.h,

          left: 20.w,
          right: 20.w,
       
        ),
        child: CategoryBlocBuilder(),
      ),
    );
  }
}
