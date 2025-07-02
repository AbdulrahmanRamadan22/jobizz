import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';


class GridViewSelectResume extends StatefulWidget {
  const GridViewSelectResume({super.key});

  @override
  State<GridViewSelectResume> createState() => _GridViewSelectResumeState();
}

class _GridViewSelectResumeState extends State<GridViewSelectResume> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisExtent: 80, //
      ),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = (selectedIndex == index) ? null : index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorsApp.whiteColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = (selectedIndex == index) ? null : index;
                    });
                  },
                  icon: Icon(
                    Icons.check_circle,
                    size: 28.r,
                    color: selectedIndex == index
                        ? ColorsApp.lightBlue
                        : ColorsApp.lightBlueGray,
                  ),
                ),
                horizontalSpace(15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: ColorsApp.darkBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'UX Designer',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyles.font8White,
                      ),
                    ),
                    verticalSpace(5),
                    Text(
                      'Haley Jessica',
                      style: TextStyles.font11Black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}