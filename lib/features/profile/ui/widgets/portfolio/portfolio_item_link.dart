import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class PortfolioItemLink extends StatelessWidget {
  const PortfolioItemLink({super.key, this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: () async {
          if (url != null) {
            await launchUrl(Uri.parse(url!));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: ColorsApp.mainBlue,

                  content: Text('Go to link $url')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not launch $url')),
            );
          }
        },
        child: Card(
          elevation: 0,
          color: ColorsApp.whiteColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(
                color: ColorsApp.lightGray,
                width: 0.7,
              )),
          child: ListTile(
            title: Text('Portfolio Link', style: TextStyles.font16Black),
            leading: Icon(
              Icons.link,
              color: ColorsApp.mainBlue,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: ColorsApp.mainBlue,
            ),
          ),
        ),
      ),
    );
  }
}
