
import 'model_user.dart';

class UserProfileSingleton {
  ModelUser? _modelUser;
  static UserProfileSingleton? _instance;

  static UserProfileSingleton? get instance {
    _instance ??= UserProfileSingleton._internal();
    return _instance;
  }

  UserProfileSingleton._internal();

  Future<void> setUserData(ModelUser? data) async {
    _modelUser = data;
  }

  Future<void> setUserName(String data) async {
    _modelUser?.name = data;
  }

  Future<void> setUserNumber(String data) async {
    _modelUser?.mobileNo = data;
  }

  Future<void> setUserEmail(String data) async {
    _modelUser?.email = data;
  }

  Future<void> setUserProfileUrl(String data) async {
    _modelUser?.profileUrl = data;
  }

  Future<void> setUserId(String data) async {
    _modelUser?.userId = data;
  }

  String getUserName() {
    return _modelUser?.name ?? '';
  }

  String getUserEmail() {
    return _modelUser?.email ?? '';
  }

  String getUserMobileNo() {
    return _modelUser?.mobileNo ?? '';
  }

  String getUserId() {
    return _modelUser?.userId ?? '';
  }

  String getUserProfileUrl() {
    return _modelUser?.profileUrl ?? '';
  }

  ModelUser? getUserData() {
    return _modelUser;
  }

  Future<void> clearUserData() async {
    _modelUser = null;
  }
}
