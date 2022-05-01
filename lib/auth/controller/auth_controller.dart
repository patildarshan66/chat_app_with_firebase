import 'package:chat_app/auth/screens/auth_screen.dart';
import 'package:chat_app/chat/screens/chat_home_screen.dart';
import 'package:chat_app/firebase/firebase_authentication_methods.dart';
import 'package:chat_app/user/models/model_user.dart';
import 'package:chat_app/utils/global_functions.dart';
import 'package:chat_app/utils/ui_helper.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  Future<void> login() async {
    try {
      startLoader(Get.context!);
      User? user = await FireBaseAuthMethods.signInWithGoogle();
      if (user != null) {
        ModelUser model = ModelUser(
          profileUrl: user.photoURL,
            userId: user.uid,
            name: user.displayName ?? 'No Name',
            email: user.email ?? '',
            mobileNo: user.phoneNumber);
        await setUserDataGlobal(model);
        closeLoader();
        Get.offAll(const ChatHomeScreen());
        showSnackBar('Login Successfully!', title: 'Success');
      } else {
        closeLoader();
        showSnackBar('Something went wrong', title: 'Error');
      }
    } catch (e) {
      closeLoader();
      print(e.toString());
      showSnackBar(e.toString(), title: 'Error');
    }
  }

  Future<void> logout() async {
    try {
      startLoader(Get.context!);
      bool isLogout = await FireBaseAuthMethods.logout();
      if (isLogout) {
        closeLoader();
        Get.offAll(const AuthScreen());
        showSnackBar('Logout Successfully!', title: 'Success');
      } else {
        closeLoader();
        showSnackBar('Something went wrong', title: 'Error');
      }
    } catch (e) {
      closeLoader();
      showSnackBar(e.toString(), title: 'Error');
    }
  }
}
