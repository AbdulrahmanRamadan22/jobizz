import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';


class CardSelectCompany extends StatelessWidget {
  const CardSelectCompany({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: ColorsApp.whiteColor,
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
              vertical: 20.0.h,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.r,
                backgroundImage: AssetImage('assets/images/image_jobs.png'),
              ),
              title: Text(
                'UX Intern',
                style: TextStyles.font14Black,
              ),
              subtitle: Text(
                'King Burger',
                style: TextStyles.font12Gray,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    r'$88,000/y',
                    style: TextStyles.font12DarkBlack,
                  ),
                  Text(
                    'Los Angels, US',
                    style: TextStyles.font12Gray,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}