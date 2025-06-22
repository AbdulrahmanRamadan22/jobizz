import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';


class ContainerOfProfileCompany extends StatelessWidget {
  const ContainerOfProfileCompany({
    super.key,
    this.companyItem,
    this.text,
  });

  final Company? companyItem;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorsApp.lightGray,
            spreadRadius: -10,
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
        color: ColorsApp.whiteColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 15.h,
        ),
        child: Text(
          text,
          style: TextStyles.font16Black,
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
