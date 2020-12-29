// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_basics/models/Place.dart';
// import 'package:flutter/cupertino.dart';

// class FireStoreServicePlace {
//   final CollectionReference _placeCollectionReference =
//       FirebaseFirestore.instance.collection('place');
//   final placeModel = Place();

//   Future<List<Place>> getPlaceDocument() async {
//     final List<Place> places = [];
//     final snapshot =
//         await _placeCollectionReference.firestore.collection('place').get();

//     if (snapshot.size > 0) {
//       print("Firestore Data collection is : ${snapshot.docs.length}");

//       snapshot.docs.forEach((doc) {
//         places.add(Place.fromJson(doc));
//         final jsonData = doc.data();
//         print(jsonData);
//       });
//       return places;
//     } else {
//       return [];
//     }
//   }

//   Future<Place> addPlaceToDocument() {
//     return _placeCollectionReference
//         .add({
//           'title': placeModel.title,
//           'address': placeModel.address,
//           'ImgUrl': placeModel.imgUrl
//         })
//         .then(
//           (value) => print("Place added Successfully ... "),
//         )
//         .catchError(
//           (onError) => print("Some thing went Wrong Try agin"),
//         );
//   }
// }
