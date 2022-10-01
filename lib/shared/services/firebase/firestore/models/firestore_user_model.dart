// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserFS {
  String uid;
  String displayName;
  String email;
  String? password;
  String? photoUrl;
  int createdAt;
  UserFS({
    required this.uid,
    required this.displayName,
    required this.email,
    this.password,
    this.photoUrl,
    required this.createdAt,
  });

  UserFS copyWith({
    String? uid,
    String? displayName,
    String? email,
    String? password,
    String? photoUrl,
    int? createdAt,
  }) {
    return UserFS(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      password: password ?? this.password,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'password': password,
      'photoUrl': photoUrl,
      'createdAt': createdAt,
    };
  }

  factory UserFS.fromMap(Map<String, dynamic> map) {
    return UserFS(
      uid: map['uid'] as String,
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      createdAt: map['createdAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFS.fromJson(String source) =>
      UserFS.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserFS(uid: $uid, displayName: $displayName, email: $email, password: $password, photoUrl: $photoUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant UserFS other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.displayName == displayName &&
        other.email == email &&
        other.password == password &&
        other.photoUrl == photoUrl &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        displayName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        photoUrl.hashCode ^
        createdAt.hashCode;
  }
}
