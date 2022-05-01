import 'package:chat_app/chat/controller/all_users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_dimensions.dart';
import '../../utils/custom_text_styles.dart';
import '../../utils/enums.dart';
import '../widgets/user_list_item.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  _AllUsersScreenState createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  final AllUsersController _controller = Get.put(AllUsersController());

  @override
  void initState() {
    // TODO: implement initState
    _controller.getAllUsersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start New Chat'),
        centerTitle: true,
      ),
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
          padding: const EdgeInsets.symmetric(
              vertical: spacing_xl, horizontal: spacing_xxl_2),
          itemCount: _controller.allUsers.length,
          itemBuilder: (ctx, i) =>
              UserListItem(modelUser: _controller.allUsers[i]),
        );
      },
    );
  }
}
