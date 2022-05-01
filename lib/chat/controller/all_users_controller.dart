import 'package:chat_app/firebase/firebase_db_methods.dart';
import 'package:chat_app/user/models/model_user.dart';
import 'package:chat_app/utils/enums.dart';
import 'package:chat_app/utils/ui_helper.dart';
import 'package:get/get.dart';

class AllUsersController extends GetxController {
  Rx<API_STATE> apiState = API_STATE.loading.obs;

  List<ModelUser> allUsers = <ModelUser>[];

  Future<void> getAllUsersList() async {
    try {
      apiState.value = API_STATE.loading;
      final res = await FirebaseDBMethods.getAllUsersData();
      if (res.isNotEmpty) {
        allUsers = res;
        apiState.value = API_STATE.data;
      } else {
        apiState.value = API_STATE.empty;
      }
    } catch (e) {
      apiState.value = API_STATE.error;
      showSnackBar(e.toString(), title: 'Error');
    }
  }
}
