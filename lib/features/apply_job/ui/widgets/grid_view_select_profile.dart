import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

// class GridViewSelectProfile extends StatefulWidget {
//   const GridViewSelectProfile({
//     super.key,
//   });
//   @override
//   State<GridViewSelectProfile> createState() => _GridViewSelectProfileState();
// }

// class _GridViewSelectProfileState extends State<GridViewSelectProfile> {
//   int? selectedIndex; // تحديد العنصر المختار فقط
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 16,
//         mainAxisExtent: 155,
//       ),
//       itemCount: 2,
//       itemBuilder: (BuildContext context, int index) {
//         return GestureDetector(
//           onTap: () {
//             setState(() {
//               selectedIndex = (selectedIndex == index) ? null : index;
//             });
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               color: ColorsApp.whiteColor,
//               borderRadius: BorderRadius.circular(12.r),
//             ),
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedIndex = (selectedIndex == index) ? null : index;
//                       });
//                     },
//                     icon: Icon(
//                       Icons.check_circle,
//                       size: 26.r,
//                       color: selectedIndex == index
//                           ? ColorsApp.lightBlue
//                           : ColorsApp.lightBlueGray,
//                     ),
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 35.r,
//                       backgroundColor: Colors.transparent,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(35.r),
//                         child: Image.network(
//                           "${SharedPrefHelper.getData(key: SharedPrefKeys.profileImage)}",
//                           width: 70.w,
//                           height: 70.h,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     verticalSpace(12),
//                     Text('Haley Jessica', style: TextStyles.font16Black),
//                     verticalSpace(4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'UX Designer',
//                           style: TextStyles.font12Gray,
//                         ),
//                         horizontalSpace(4),
//                         Icon(
//                           Icons.check_circle,
//                           color: ColorsApp.lightBlue,
//                           size: 15.r,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class GridViewSelectProfile extends StatelessWidget {
  const GridViewSelectProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.check_circle,
                size: 26.r,
                color: ColorsApp.mainBlue,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35.r,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35.r),
                  child: Image.network(
                    "${SharedPrefHelper.getData(key: SharedPrefKeys.profileImage)}",
                    width: 70.w,
                    height: 70.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              verticalSpace(12),
              Text("${SharedPrefHelper.getData(key: SharedPrefKeys.fullName)}",
                  style: TextStyles.font16Black),
              verticalSpace(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${SharedPrefHelper.getData(key: SharedPrefKeys.titleJob)}",
                    style: TextStyles.font12Gray,
                  ),
                  horizontalSpace(4),
                  Icon(
                    Icons.check_circle,
                    color: ColorsApp.lightBlue,
                    size: 15.r,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
