import 'package:chat_app/chat/screens/chat_screen.dart';
import 'package:chat_app/user/models/model_user.dart';
import 'package:chat_app/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_dimensions.dart';
import 'package:get/get.dart';

class UserListItem extends StatelessWidget {
  final ModelUser modelUser;
  const UserListItem({Key? key, required this.modelUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.off(ChatScreen(modelUser));
      },
      child: Container(
        padding: const EdgeInsets.all(spacing_xl),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(spacing_xl),
            boxShadow: const [
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 1,
              )
            ]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(spacing_xxl_7),
              child: modelUser.profileUrl != null
                  ? Image.network(
                      modelUser.profileUrl ?? '',
                      height: spacing_xxl_20,
                      width: spacing_xxl_20,
                    )
                  : const Icon(
                      Icons.person,
                      size: spacing_xxl_20,
                    ),
            ),
            const SizedBox(width: spacing_xxl_4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(modelUser.name, style: subTitle1_16ptBold()),
                  Text(modelUser.email, style: caption12ptRegular()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
