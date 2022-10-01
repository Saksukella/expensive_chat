// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:expensive_chat/shared/services/firebase/firestore/models/firestore_user_model.dart';

class MessageModel {
  String? id;
  String text;
  String uid;
  DateTime createdAt;
  bool isSelected;
  UserFS? userFS;
  MessageModel({
    this.id,
    required this.text,
    required this.uid,
    required this.createdAt,
    required this.isSelected,
    this.userFS,
  });

  MessageModel copyWith({
    String? id,
    String? text,
    String? uid,
    DateTime? createdAt,
    bool? isSelected,
    UserFS? userFS,
  }) {
    return MessageModel(
      id: id ?? this.id,
      text: text ?? this.text,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      isSelected: isSelected ?? this.isSelected,
      userFS: userFS ?? this.userFS,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'uid': uid,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isSelected': isSelected,
      'userFS': userFS?.toMap(),
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] != null ? map['id'] as String : null,
      text: map['text'] as String,
      uid: map['uid'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      isSelected: map['isSelected'] as bool,
      userFS: map['userFS'] != null
          ? UserFS.fromMap(map['userFS'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(id: $id, text: $text, uid: $uid, createdAt: $createdAt, isSelected: $isSelected, userFS: $userFS)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.text == text &&
        other.uid == uid &&
        other.createdAt == createdAt &&
        other.isSelected == isSelected &&
        other.userFS == userFS;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        uid.hashCode ^
        createdAt.hashCode ^
        isSelected.hashCode ^
        userFS.hashCode;
  }
}
