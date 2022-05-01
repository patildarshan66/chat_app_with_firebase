import 'package:chat_app/chat/models/model_chat.dart';
import 'package:chat_app/utils/ui_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../user/models/model_user.dart';
import '../user/models/user_profile_singleton.dart';

class FirebaseDBMethods {
  static final FirebaseFirestore _fireStoreInstance =
      FirebaseFirestore.instance;

  static Future<void> storeUserDataInDB(ModelUser user) async {
    try {
      await _fireStoreInstance
          .collection("users")
          .doc(user.userId)
          .set(user.toMap());
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ModelUser>> getAllUsersData() async {
    try {
      final res = await _fireStoreInstance.collection("users").get();
      final map = res.docs;
      List<ModelUser> ls = [];
      if (map.isNotEmpty) {
        for (var i in map) {
          var data = ModelUser.fromMap(i.data());
          if (data.userId != UserProfileSingleton.instance?.getUserId()) {
            ls.add(data);
          }
        }
      }
      return ls;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ModelUser>> getAllChatUsersData() async {
    try {
      final res = await _fireStoreInstance
          .collection(UserProfileSingleton.instance?.getUserId() ?? '')
          .get();
      final map = res.docs;
      List<ModelUser> ls = [];
      if (map.isNotEmpty) {
        for (var i in map) {
          var data = ModelUser.fromMap(i.data());
          ls.add(data);
        }
      }
      return ls;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ModelChat>> getUserChat(String id) async {
    try {
      final res = await _fireStoreInstance
          .collection(UserProfileSingleton.instance?.getUserId() ?? '')
          .doc(id)
          .collection('chat')
          .get();
      final map = res.docs;
      List<ModelChat> ls = [];
      if (map.isNotEmpty) {
        for (var i in map) {
          ls.add(ModelChat.fromMap(i.data()));
        }
      }
      return ls;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> addChatUserData(ModelUser user)async{
    try{
      await _fireStoreInstance
          .collection(UserProfileSingleton.instance?.getUserId() ?? '')
          .doc(user.userId).set(user.toMap());
      return true;
    }catch(e){
      showSnackBar(e.toString(),title: 'Error');
      return false;
    }
  }
  static Future<bool> addChat(String id, String msg) async {
    try {
      final data = ModelChat(
          msg: msg, dateTime: DateTime.now().toIso8601String(), isMine: false);
      final res = await _fireStoreInstance
          .collection(UserProfileSingleton.instance?.getUserId() ?? '')
          .doc(id)
          .collection('chat')
          .add(data.toMap());
      // List<ModelUser> ls = [];
      // if (map.isNotEmpty) {
      //   for (var i in map) {
      //     var data = ModelUser.fromMap(i.data());
      //     if (data.userId != UserProfileSingleton.instance?.getUserId()) {
      //       ls.add(data);
      //     }
      //   }
      // }
      return true;
    } catch (e) {
      showSnackBar(e.toString(), title: 'Error');
      return false;
    }
  }

  static Future<ModelUser?> getUserData() async {
    try {
      final res = await _fireStoreInstance
          .collection("users")
          .doc(UserProfileSingleton.instance?.getUserId())
          .get();
      final map = res.data();
      return map != null ? ModelUser.fromMap(map) : null;
    } catch (e) {
      rethrow;
    }
  }
  //
  // static Future<void> storeUserPost(ModelAddPost modelAddPost) async {
  //   try {
  //     await _fireStoreInstance.collection("Posts").add(modelAddPost.toMap());
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // static Future<String?> storeImage(File image, String fileName) async {
  //   try {
  //     Reference storageReference =
  //     _firebseStorageInstance
  //         .ref()
  //         .child('images/${UserProfileSingleton.instance!.getUserId()}/' +
  //         fileName);
  //      await storageReference.putFile(image);
  //     String url =  await storageReference.getDownloadURL();
  //     return url;
  //   } catch (e) {
  //     log(e.toString());
  //     return null;
  //   }
  // }
  //
  // static Future<List<ModelAddPost>> getUserPostsList() async {
  //   try {
  //     final res = await _fireStoreInstance
  //         .collection("Posts")
  //         .where("userId",
  //             isEqualTo: UserProfileSingleton.instance?.getUserId())
  //         .get();
  //     final map = res.docs;
  //     return modelAddPostFromMap(map);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

}
