import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';

import '../../../../shared/ui/app_theme/theme/utils/theme_utils.dart';
import '../controllers/message_controller.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    MessageController msgController = Get.put(MessageController());
    types.User _user = msgController.user;
    return Obx(() {
      return Chat(
        scrollPhysics: BouncingScrollPhysics(),
        theme: DefaultChatTheme(
          primaryColor: theme.primaryColor,
          inputTextDecoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              fillColor: Colors.transparent),
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
        messages: msgController.messages.value,
        onMessageLongPress: (ctx, message) {
          msgController.deleteMessage(message.id);
        },
        onAttachmentPressed: () {},
        onSendPressed: (partialText) async {
          msgController.uploadMessage(partialText.text);
        },
        showUserAvatars: true,
        showUserNames: true,
        user: _user,
      );
    });
  }
}
