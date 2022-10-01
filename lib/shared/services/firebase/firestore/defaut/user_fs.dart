import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firestore.dart';
import '../models/firestore_user_model.dart';

class FSUserService implements FSService<UserFS> {
  DocumentReference _userRef = FirebaseFirestore.instance
      .collection('users_info')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Future<void> deleteCloud({String? id}) async {
    await _userRef.delete();
  }

  @override
  Stream<List<UserFS>> getStream() {
    return _userRef.snapshots().map(
        (event) => [UserFS.fromMap(event.data()! as Map<String, dynamic>)]);
  }

  @override
  Future<UserFS?> readCloud({String? id}) async {
    final snapshot = await _userRef.get();
    if (snapshot.data() == null) return null;

    return UserFS.fromMap(snapshot.data()! as Map<String, dynamic>);
  }

  Future<UserFS?> userwID(String id) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('users_info').doc(id).get();
    if (snapshot.data() == null) return null;

    return UserFS.fromMap(snapshot.data()!);
  }

  @override
  Future<void> savetoCloud(t) {
    return _userRef.set(t.toMap());
  }

  @override
  Future<void> updateCloud(t, {String? id}) {
    return _userRef.update(t.toMap());
  }
}
