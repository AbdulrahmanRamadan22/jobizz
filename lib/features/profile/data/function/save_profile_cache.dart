import 'package:flutter/material.dart';

import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../models/profile_response_model.dart';

Future<void> saveProfile(ProfileResponseModel profileResponse) async {

 debugPrint('🤞 saveProfile: Starting profile save for ID ${profileResponse.profileData?.id}');

  await SharedPrefHelper.saveData(
    key: SharedPrefKeys.idProfile,
    value: profileResponse.profileData?.id,
  );

  await SharedPrefHelper.saveData(
    key: SharedPrefKeys.profileImage,
    value: profileResponse.profileData?.profileImage,
  );

  await SharedPrefHelper.saveData(
    key: SharedPrefKeys.titleJob,
    value: profileResponse.profileData?.titleJob,
  );

  // // bool? onBoardingIsDone =
  // //     await SharedPrefHelper.getData(key: SharedPrefKeys.onBoardingIsDone);
  // // debugPrint('saveProfile: onBoardingIsDone after save = $onBoardingIsDone');
  // bool? onBoardingIsDone =
  //     await SharedPrefHelper.getData(key: SharedPrefKeys.onBoardingIsDone);
  // String? userToken =
  //     await SharedPrefHelper.getSecuredString(key: SharedPrefKeys.token);
  // debugPrint('saveProfile: onBoardingIsDone = $onBoardingIsDone');
  // debugPrint(
  //     'saveProfile: userToken = ${userToken != null ? "present" : "null/empty"}');
}
