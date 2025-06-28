import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/routing/routers_string.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/saved_jobs/data/model/saved_response.dart';
import 'package:jobizz/features/saved_jobs/ui/widgets/row_job_status_and_salary.dart';

class ItemSavedJobs extends StatelessWidget {
  const ItemSavedJobs({
    super.key,
    this.job,
  });

  final SavedJob? job;

  @override
  Widget build(BuildContext context) {
    // متناش تعملها switch case
    final Color statusColor;
    if (job?.jobStatus == 'Open || open') {
      statusColor = ColorsApp.lightBlue2;
    } else if (job?.jobStatus == 'Closed || closed') {
      statusColor = ColorsApp.lightRed;
    } else {
      statusColor = ColorsApp.lightBlue2; // Default color for unknown status
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: () {
          //  context.pushNamed(Routes.jobDetailsScreen, arguments: job);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsApp.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: ColorsApp.lightGray,
              width: 0.7,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.network(
                    job?.companyLogo ?? '',
                    height: 50.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image_not_supported);
                    },
                  ),
                  title: Text(
                    job?.categoryName ?? 'No Category',
                    style: TextStyles.font14Black,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    job?.companyName ?? 'No Company',
                    style: TextStyles.font14Gray,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 120.w, // يمكنك تعديل هذا الرقم حسب احتياجاتك
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$${job?.salary}/y',
                          style: TextStyles.font12DarkBlack,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        verticalSpace(4),
                        Text(
                          job?.location ?? 'Location not specified',
                          style: TextStyles.font14Gray,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(16),
                JobStatusAndSallary(statusColor: statusColor, job: job),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
