import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../jobs/data/models/job.dart';

class CardSelectCompany extends StatelessWidget {
  final Job? job;

  const CardSelectCompany({super.key, this.job});

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
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: ColorsApp.backGroundWhite,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Image.network(
                  job?.companyLogo ?? 'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 50,
                    );
                  },
                ),
              ),
              title: Text(
                job?.title ?? 'title ',
                style: TextStyles.font14Black,
              ),
              subtitle: Text(
                job?.companyName ?? 'Company Name',
                style: TextStyles.font12Gray,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${job?.salary}/y',
                    style: TextStyles.font12DarkBlack,
                  ),
                  Text(
                    job?.location ?? 'Location',
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
