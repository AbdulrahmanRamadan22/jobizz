// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';

class BuildMeanItem extends StatelessWidget {
  const BuildMeanItem({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 24.w,
      leading: Icon(icon, color: iconColor ?? ColorsApp.gray, size: 24.r),
      title: Text(title, style: TextStyles.font16Black),
      trailing: Icon(
        Icons.chevron_right,
        color: ColorsApp.gray,
        size: 24.r,
      ),
      onTap: onTap,
    );
  }
}
