import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_basics/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final String _serviceName = 'FIRESTORE';

  Future createUserDocument(FireUser fireUser) async {
    try {
      debugPrint('$_serviceName - SET_user');
      await _usersCollectionReference.doc(fireUser.id).set(fireUser.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future getUserDocument(String uid) async {
    try {
      debugPrint('$_serviceName - GET_user');
      final userData = await _usersCollectionReference.doc(uid).get();
      return FireUser.fromData(userData.data());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future<bool> doesUserExist(String docID) async {
    final _snapShot = await _usersCollectionReference.doc(docID).get();
    if (_snapShot == null || !_snapShot.exists) {
      return false;
    } else {
      return true;
    }
  }
}
