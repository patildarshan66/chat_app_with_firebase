import 'package:chat_app/user/userSharedPref/user_shared_pref_keys.dart';

import '../../sharefPref/custom_shared_pref.dart';
import '../../utils/global_functions.dart';
import '../models/model_user.dart';
import '../models/user_profile_singleton.dart';

class UserSharedPref {
  static Future<void> saveUserId(String id) async {
    try {
      SharedPrefCustom.setStringToPref(USER_ID, id);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> saveUserData(ModelUser data) async {
    try {
      SharedPrefCustom.setMapToPref(USER_DATA, data.toMap());
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> saveLoggedIn() async {
    try {
      SharedPrefCustom.setBoolToPref(USER_LOGGED_IN, true);
    } catch (e) {
      rethrow;
    }
  }

  static Future<String?> getUserId() async {
    try {
      return await SharedPrefCustom.getStringFromPref(USER_ID);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ModelUser?> getUserData() async {
    try {
      final data = await SharedPrefCustom.getMapFromPref(USER_DATA);
      if (data == null) {
        return null;
      }
      final model = ModelUser.fromMap(data);
      await UserProfileSingleton.instance?.setUserData(model);
      return model;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool?> getUserLoggedIn() async {
    try {
      final data = await SharedPrefCustom.getBoolFromPref(USER_LOGGED_IN);
      if (data == null) {
        return false;
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
