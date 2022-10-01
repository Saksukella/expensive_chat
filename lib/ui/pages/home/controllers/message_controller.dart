import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';

import '../../../../services/firebase/message_fs.dart';
import '../../../../shared/services/firebase/auth/utils/auth_utils.dart';
import '../models/message_model.dart';

class MessageController extends GetxController {
  final RxList<types.Message> _messages = <types.Message>[].obs;
  FSMessageService _fsMessageService = FSMessageService();

  @override
  void onInit() {
    super.onInit();
    _messages.bindStream(_fsMessageService.getMsgStream());
  }

  final _user = types.User(
    id: auth.user!.uid,
    firstName: auth.safeName.split(" ")[0],
    createdAt: auth.user!.metadata.creationTime!.millisecondsSinceEpoch,
    imageUrl: auth.user!.photoURL,
  );

  get user => _user;

  RxList<types.Message> get messages => _messages;

  void uploadMessage(String text) {
    _fsMessageService.savetoCloud(MessageModel(
      text: text,
      isSelected: false,
      uid: auth.user!.uid,
      createdAt: DateTime.now(),
    ));
  }

  void deleteMessage(String id) {
    _fsMessageService.deleteCloud(id: id);
  }
}
