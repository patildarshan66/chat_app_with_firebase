import 'package:chat_app/firebase/firebase_db_methods.dart';

import '../sharefPref/custom_shared_pref.dart';
import '../user/models/model_user.dart';
import '../user/models/user_profile_singleton.dart';
import '../user/userSharedPref/user_shared_pref.dart';

Future<bool> setUserDataGlobal(ModelUser modelUser) async {
  try {
    await UserProfileSingleton.instance?.setUserData(modelUser);
    await FirebaseDBMethods.storeUserDataInDB(modelUser);
    await UserSharedPref.saveLoggedIn();
    await UserSharedPref.saveUserId(modelUser.userId);
    await UserSharedPref.saveUserData(modelUser);
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> removeUserDataGlobal() async {
  try {
    await UserProfileSingleton.instance?.setUserData(null);
    await SharedPrefCustom.clearAllPref();
    return true;
  } catch (e) {
    return false;
  }
}
