import 'package:firebase_basics/routes/route_names.dart';
import 'package:firebase_basics/services/authentication_service.dart';
import 'package:firebase_basics/services/dialog_service.dart';
import 'package:firebase_basics/services/navigation_service.dart';
import 'package:flutter/material.dart';
import '../../../locator.dart';
import '../base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({@required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);
    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'Login Failed. please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login',
        description: result,
      );
    }
  }

  void navigateToSignup() {
    _navigationService.navigateTo(SignUpViewRoute);
  }
}
