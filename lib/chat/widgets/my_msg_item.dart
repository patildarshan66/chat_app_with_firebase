import 'package:chat_app/chat/models/model_chat.dart';
import 'package:chat_app/utils/custom_dimensions.dart';
import 'package:flutter/material.dart';

class MyMsgItem extends StatelessWidget {
  final ModelChat chat;
  const MyMsgItem(this.chat, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacing_m),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(spacing_xl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(chat.msg),
          Text(chat.dateTime),
        ],
      ),
    );
  }
}
