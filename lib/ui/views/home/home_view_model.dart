import 'package:firebase_basics/locator.dart';
import 'package:firebase_basics/models/Place.dart';
import 'package:firebase_basics/services/dialog_service.dart';
import 'package:firebase_basics/services/firestore_service.dart';
import 'package:firebase_basics/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';

import '../base_model.dart';

class HomeViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  navigateToCreateView() {}
  Future addPlace({String title, String address, String imgUrl}) async {
    setBusy(true);
    var result = await _firestoreService
        .addPlace(Place(title: title, address: address, imgUrl: imgUrl));
    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'coude not create new place',
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Place Sucessfully Added!',
        description: 'your post is created Successfully !',
      );
    }
    _navigationService.pop();
  }
}
