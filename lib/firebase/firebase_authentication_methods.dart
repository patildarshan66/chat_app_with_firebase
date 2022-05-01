import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/ui_helper.dart';

class FireBaseAuthMethods {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user!;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      throw e.message.toString();
    }
  }

  static Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message.toString(),title: 'Error');
      throw false;
    }
  }

  static Future<User?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      UserCredential result = await _auth.signInWithCredential(credential);
      return result.user;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      throw e.message.toString();
    }
  }

  static Future<User?> signUpWithEmail(email, password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user!;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      throw e.message.toString();
    }
  }

  static Future<void> forgotPasswordWithEmail(email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      throw e.message.toString();
    }
  }

  // static Future<User?> signInWithFaceBook() async {
  //   try {
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //     // Create a credential from the access token
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //     // Once signed in, return the UserCredential
  //     UserCredential result =
  //         await _auth.signInWithCredential(facebookAuthCredential);
  //     return result.user;
  //   } on FirebaseAuthException catch (e) {
  //     print('Failed with error code: ${e.code}');
  //     print(e.message);
  //     throw e.message.toString();
  //   }
  // }
}
