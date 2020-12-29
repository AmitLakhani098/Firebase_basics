import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_basics/models/Place.dart';
import 'package:firebase_basics/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference _placeCollectionReference =
      FirebaseFirestore.instance.collection('place');

  Future createUserDocument(FireUser fireUser) async {
    try {
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

  // @@@@@ Place @@@@@

  Future getPlace(String uid) async {
    try {
      var placeData = await _placeCollectionReference.doc(uid).get();
      return Place.fromJson(placeData.data());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future addPlace(Place place) async {
    try {
      await _placeCollectionReference.add(place.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }
}
