import 'package:firebase_basics/locator.dart';
import 'package:firebase_basics/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_basics/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final String _service = 'FIRESTORE_AUTH';
  FireUser _currentUser;
  FireUser get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
    @required String role,
  }) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore

      await createFireUserProfile(
        id: authResult.user.uid,
        email: email,
        name: fullName,
        role: 'user',
      );

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future createFireUserProfile({
    @required String id,
    @required String email,
    @required String name,
    String role,
  }) async {
    final _result = await _firestoreService.doesUserExist(id);
    if (_result != true) {
      _currentUser = FireUser(
        id: id,
        email: email,
        fullName: name,
        userRole: 'user',
      );
      await _firestoreService.createUserDocument(_currentUser);
    } else {
      debugPrint('$_service - RESULT_ user already EXISTS');
    }
  }

  Future<bool> isUserLoggedIn() async {
    var _user = _firebaseAuth.currentUser;
    await _populateCurrentUser(_user);
    if (_user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUserDocument(user.uid);
    }
  }

  Future<void> signOut() async {
    print('$_service - RESULT_ Signing Out');
    await _firebaseAuth.signOut();
  }
}
