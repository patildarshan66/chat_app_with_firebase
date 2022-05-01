import 'package:chat_app/auth/controller/auth_controller.dart';
import 'package:chat_app/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_dimensions.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 86, 102, 130),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to Chat App',
                style: h2_32ptBold(color: Colors.amberAccent), textAlign: TextAlign.right),
            const SizedBox(height: spacing_xxl_34),
            InkWell(
              onTap: (){
                _authController.login();
              },
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Login with Google',
                    style: subTitle1_16ptRegular(color: Colors.cyan)),
                Image.asset(
                  'assets/images/google.png',
                  height: 75,
                  width: 75,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
