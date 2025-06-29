import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/features/profile/ui/widgets/custom_card_data_is_empty.dart';

import '../../../data/models/profile_response_model.dart';
import '../../widgets/education/education_item_details.dart';

class EducationsScreen extends StatelessWidget {
  const EducationsScreen({super.key, this.educations});

  final List<Education>? educations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educations'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 20.0.w),
        child: CustomScrollView(slivers: [
          if (educations?.isEmpty ?? false)
            SliverToBoxAdapter(
              child: CustomCardDataIsEmpty(
                title: 'No Education Added Yet',
                onTap: () {},
              ),
            ),
          SliverList.separated(
            itemCount: educations?.length ?? 0,
            separatorBuilder: (context, index) => verticalSpace(10),
            itemBuilder: (context, index) => EducationItemDetails(
              education: educations?[index],
            ),
          ),
        ]),
      ),
    );
  }
}
