// import 'package:flutter/material.dart';
// import 'package:jobizz/features/profile/ui/widgets/education/education_item.dart';

// import '../../../data/models/profile_response_model.dart';

// class EducationsScreen extends StatelessWidget {
//   const EducationsScreen({super.key,this.educations});
//   final List<Education>? educations;


//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         childCount:  educations?.length ?? 0,
//         (context, index) {
//           return  EducationItem(
//              education: educations?[index],
//           );
//         },
//       ),
//     );
//   }
// }