import 'package:chat_app/chat/models/model_chat.dart';
import 'package:chat_app/firebase/firebase_db_methods.dart';
import 'package:get/get.dart';

import '../../utils/enums.dart';
import '../../utils/ui_helper.dart';

class ChatController extends GetxController {
  Rx<API_STATE> apiState = API_STATE.loading.obs;
  List<ModelChat> chatList = [];
  Future<bool> addChat(String id, String msg) async {
    try {
      // apiState.value = API_STATE.loading;
      final isSent = await FirebaseDBMethods.addChat(id, msg);
      if (isSent) {
        await getAllChat(id);
        return true;
      }
      return false;

      // apiState.value = API_STATE.data;
    } catch (e) {
      // apiState.value = API_STATE.error;
      showSnackBar(e.toString(), title: 'Error');
      return false;
    }
  }

  Future<void> getAllChat(String id) async {
    try {
      apiState.value = API_STATE.loading;
      final res = await FirebaseDBMethods.getUserChat(id);
      if (res.isNotEmpty) {
        chatList = res;
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
