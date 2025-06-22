  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/size_box.dart';

Widget buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
    required Color color,
    bool isDestructive = false,
  }) {
    return MenuItemButton(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
        minimumSize: WidgetStatePropertyAll(Size(120.w, 40.h)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: isDestructive
                  ? color.withValues(alpha: 0.1)
                  : color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(
              icon,
              size: 16.sp,
              color: color,
            ),
          ),
          horizontalSpace(12),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isDestructive ? color : Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }