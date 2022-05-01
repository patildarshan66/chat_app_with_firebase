import 'package:chat_app/user/userSharedPref/user_shared_pref.dart';
import 'package:flutter/material.dart';

import 'auth/screens/auth_screen.dart';
import 'chat/screens/chat_home_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool? isLogin = await UserSharedPref.getUserLoggedIn();
  Widget home = const AuthScreen();
  if (isLogin != null && isLogin) {
    await UserSharedPref.getUserData();
    home = const ChatHomeScreen();
  }
  runApp(MyApp(home: home));
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({Key? key, required this.home}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home,
    );
  }
}
