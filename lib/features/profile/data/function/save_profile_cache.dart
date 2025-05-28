

  import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../models/profile_response_model.dart';

Future<void> saveProfile(ProfileResponseModel profileResponse) async {
   
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

    }