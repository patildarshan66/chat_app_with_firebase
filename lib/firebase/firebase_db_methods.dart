import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseDBMethods {
  static final FirebaseFirestore _fireStoreInstance =
      FirebaseFirestore.instance;

  // static Future<void> storeUserData(ModelUser user) async {
  //   try {
  //     await _fireStoreInstance
  //         .collection("users")
  //         .doc(user.userId)
  //         .collection("User Info")
  //         .doc('User Data')
  //         .set(user.toMap());
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // static Future<ModelUser> getUserData() async {
  //   try {
  //     final res = await _fireStoreInstance
  //         .collection("users")
  //         .doc(UserProfileSingleton.instance?.getUserId())
  //         .collection("User Info")
  //         .doc('User Data')
  //         .get();
  //     final map = res.data();
  //     return ModelUser.fromMap(map ?? {});
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
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
