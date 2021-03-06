import 'package:chat_app/chat/controller/chat_home_controller.dart';
import 'package:chat_app/chat/screens/all_users_screen.dart';
import 'package:chat_app/utils/custom_dimensions.dart';
import 'package:chat_app/utils/custom_text_styles.dart';
import 'package:chat_app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/user_list_item.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  _ChatHomeScreenState createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  final ChatHomeController _controller = Get.put(ChatHomeController());
  @override
  void initState() {
    // TODO: implement initState
    _controller.getChatUsersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        centerTitle: true,
      ),
      floatingActionButton: _getFloatingActionBtn(),
      body: _getBody(),
    );
  }

  _getBody() {
    return Obx(
      () {
        var state = _controller.apiState.value;
        if (state == API_STATE.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state == API_STATE.empty) {
          return Center(
            child: Text(
              'No Chats Available!',
              style: subTitle1_16ptMedium(color: Colors.black87),
            ),
          );
        }

        if (state == API_STATE.error) {
          return Center(
              child: Text('Something went wrong!', style: caption12ptBold()));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(spacing_xxl_4),
          itemCount: _controller.allUsers.length,
          itemBuilder: (ctx, i) => UserListItem(
            modelUser: _controller.allUsers[i],
          ),
        );
      },
    );
  }

  _getFloatingActionBtn() {
    return FloatingActionButton(
        onPressed: () {
          Get.to(const AllUsersScreen());
        },
        child: const Icon(Icons.add));
  }
}
