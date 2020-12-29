// import 'dart:convert';
// import 'package:firebase_basics/models/Place.dart';
// import 'package:firebase_basics/services/firestore_service_place.dart';
// import 'package:firebase_basics/ui/views/home/home_view_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:provider_architecture/provider_architecture.dart';

// class HomeView extends StatefulWidget {
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   final _fireStoreServicePlace = FireStoreServicePlace();
//   void initState() {
//     // userScore = jsonData['scores']["subject"];
//     // print("User Score fot subject is ${userScore}");
//     super.initState();
//     _getFirebaseData();
//   }

//   _getFirebaseData() async {
//     final place = await _fireStoreServicePlace.getPlaceDocument();
//     print(place);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelProvider.withConsumer(
//       builder: (context, model, child) => Scaffold(
//         appBar: AppBar(
//           title: Text("HomeScreen"),
//         ),
//         // body: FutureBuilder(
//         //   future:
//         //       DefaultAssetBundle.of(context).loadString("assets/jsonData.json"),
//         //   builder: (context, snapshot) {
//         //     var myJsonData = json.decode(snapshot.data.toString());
//         //     if (myJsonData == null) {
//         //       return Center(
//         //         child: Text("Loading Json Data...."),
//         //       );
//         //     } else {
//         //       return Center(
//         //         child: Text(myJsonData["scores"][0]["subject"]),
//         //       );
//         //     }
//         //   },
//         // ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             RaisedButton(
//               child: Text("Get Git hub info"),
//               onPressed: _getFirebaseData,
//             )
//           ],
//         ),
//       ),
//       viewModelBuilder: () => HomeViewModel(),
//     );
//   }
// }
import 'package:firebase_basics/ui/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: !model.busy ? Icon(Icons.add) : CircularProgressIndicator(),
          onPressed: model.navigateToCreateView,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Add Farm",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
