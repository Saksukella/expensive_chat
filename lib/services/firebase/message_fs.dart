import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../shared/services/firebase/firestore/defaut/user_fs.dart';
import '../../shared/services/firebase/firestore/firestore.dart';
import '../../shared/services/firebase/firestore/models/firestore_user_model.dart';
import '../../ui/pages/home/models/message_model.dart';

class FSMessageService implements FSService<MessageModel> {
  CollectionReference _messageRef =
      FirebaseFirestore.instance.collection('users_message');
  @override
  Future<void> deleteCloud({String? id}) {
    return _messageRef.doc(id).delete();
  }

  @override
  Stream<List<MessageModel>> getStream() {
    return _messageRef.snapshots().map((event) {
      return event.docs.map((e) {
        return MessageModel.fromMap(e.data() as Map<String, dynamic>).copyWith(
          id: e.id,
        );
      }).toList();
    });
  }

  //create message stream

  Stream<List<types.Message>> getMsgStream() {
    return _messageRef
        .orderBy("createdAt", descending: true)
        .snapshots()
        .asyncMap((event) async {
      return await Future.wait(
        event.docs.map(
          (element) async {
            if (element.data() == null) {
              return types.TextMessage(
                  text: "null", id: element.id, author: types.User(id: ''));
            }

            Map<String, dynamic> data = element.data() as Map<String, dynamic>;
            log(data['uid'].toString());
            UserFS? userFS = await FSUserService().userwID(data['uid']);

            if (userFS == null) {
              return types.TextMessage(
                  text: "null", id: element.id, author: types.User(id: ''));
            }
            return types.TextMessage(
              id: element.id,
              text: data['text'],
              showStatus: true,
              status: types.Status.sent,
              createdAt: data['createdAt'],
              author: types.User(
                id: userFS.uid,
                firstName: userFS.displayName.split(" ")[0],
                createdAt: userFS.createdAt,
                imageUrl: userFS.photoUrl,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  Future<MessageModel?> readCloud({String? id}) {
    return _messageRef.doc(id).get().then((value) {
      if (value.data() == null) return null;
      return MessageModel.fromMap(value.data()! as Map<String, dynamic>)
          .copyWith(id: value.id);
    });
  }

  @override
  Future<void> savetoCloud(t) {
    return _messageRef.add(t.toMap());
  }

  @override
  Future<void> updateCloud(t, {String? id}) {
    return _messageRef.doc(id).update(t.toMap());
  }
}
