import 'package:flutter/material.dart';
import 'package:jobizz/features/switch_profile/ui/widgets/switch_profile_item.dart';
import '../../data/models/profile_response_model.dart';

class ListViewSwitchProfiles extends StatelessWidget {
  const ListViewSwitchProfiles({
    super.key,
    this.profiles,
  });

  final List<ProfileModel?>? profiles;

  @override
  Widget build(BuildContext context) {
    // Create a copy of the profiles list and sort it
    final sortedProfiles = profiles?.toList() ?? [];
    sortedProfiles.sort((a, b) {
      final aIsDefault = a?.isDefault == 1;
      final bIsDefault = b?.isDefault == 1;
      
      if (aIsDefault && !bIsDefault) {
        return -1; // a comes before b
      } else if (!aIsDefault && bIsDefault) {
        return 1; // b comes before a
      }
      return 0; // maintain original order for others
    });

    return ListView.builder(
      itemCount: sortedProfiles.length,
      itemBuilder: (context, index) {
        final profile = sortedProfiles[index];
        return SwitchProfileItem(
          profileModel: profile,
        );
      },
    );
  }
}