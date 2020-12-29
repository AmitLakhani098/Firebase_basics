import 'package:firebase_basics/locator.dart';
import 'package:firebase_basics/models/user.dart';
import 'package:firebase_basics/services/authentication_service.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  // Cheak user is Authenticated ot Not >
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  FireUser get currentUser => _authenticationService.currentUser;
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
