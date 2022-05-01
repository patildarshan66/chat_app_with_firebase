import 'package:chat_app/chat/controller/chat_controller.dart';
import 'package:chat_app/firebase/firebase_db_methods.dart';
import 'package:chat_app/user/models/model_user.dart';
import 'package:chat_app/utils/ui_helper.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_dimensions.dart';
import 'package:get/get.dart';

import '../../utils/custom_text_styles.dart';
import '../../utils/enums.dart';
import '../widgets/my_msg_item.dart';

class ChatScreen extends StatefulWidget {
  final ModelUser user;
  const ChatScreen(this.user, {Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController _controller = Get.put(ChatController());

  final TextEditingController _msg = TextEditingController();
  @override
  void initState() {
    _controller.getAllChat(widget.user.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getBody() {
    return Obx(
      () {
        var state = _controller.apiState.value;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (state == API_STATE.loading)
              const Expanded(child: Center(child: CircularProgressIndicator())),
            if (state == API_STATE.empty)
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'No Chats Available!',
                    style: subTitle1_16ptMedium(color: Colors.black87),
                  ),
                ),
              ),
            if (state == API_STATE.error)
              Expanded(
                child: Center(
                    child: Text('Something went wrong!',
                        style: caption12ptBold())),
              ),
            if (state == API_STATE.data)
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(spacing_xl),
                  itemCount: _controller.chatList.length,
                  itemBuilder: (ctx, i) => MyMsgItem(_controller.chatList[i]),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xxl_2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _msg,
                      decoration: const InputDecoration(
                        hintText: 'Message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        if (_controller.chatList.isEmpty) {
                          await FirebaseDBMethods.addChatUserData(widget.user);
                        }
                        if (_msg.text.isNotEmpty) {
                          await _controller
                              .addChat(widget.user.userId, _msg.text)
                              .then((value) {
                            _msg.clear();
                          });
                        } else {
                          showSnackBar('Empty message not allowed...',
                              title: '');
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        size: 40,
                        color: Colors.blue,
                      ))
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  _getAppBar() {
    return AppBar(
      leading: Row(
        children: [
          const Icon(Icons.arrow_back),
          // const SizedBox(width: spacing_xs),
          ClipRRect(
            borderRadius: BorderRadius.circular(spacing_xxl_2),
            child: widget.user.profileUrl != null
                ? Image.network(
                    widget.user.profileUrl ?? '',
                    height: spacing_xxl_10,
                    width: spacing_xxl_10,
                  )
                : const Icon(
                    Icons.person,
                    size: spacing_xxl_10,
                  ),
          )
        ],
      ),
      title: Text(widget.user.name),
      centerTitle: true,
    );
  }
}
