import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_basics/models/user.dart';

class FirestoreService {
  final CollectionReference _userCollectionRefrerence =
      Firestore.instance.collection('users');

  Future createUser(User user) async {
    try {
      await _userCollectionRefrerence.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userdata = await _userCollectionRefrerence.document(uid).get();
      return User.fromData(userdata.data);
    } catch (e) {
      return e.message;
    }
  }
}
