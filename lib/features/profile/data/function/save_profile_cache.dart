

  import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../models/profile_response_model.dart';

Future<void> saveProfile(ProfileResponseModel profileResponse) async {
   
      await SharedPrefHelper.saveData(
        key: SharedPrefKeys.idProfile,
        value: profileResponse.data.id,
      );
    
      await SharedPrefHelper.saveData(
        key: SharedPrefKeys.profileImage,
        value: profileResponse.data.profileImage,
      );

       await SharedPrefHelper.saveData(
        key: SharedPrefKeys.titleJob,
        value: profileResponse.data.titleJob,
      );

    }