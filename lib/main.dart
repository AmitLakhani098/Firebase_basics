import 'package:firebase_basics/ui/views/login/login_view.dart';
import 'package:firebase_basics/ui/views/signup/signup_view.dart';
import 'package:firebase_basics/services/dialog_service.dart';
import 'package:firebase_basics/ui/views/startup/startup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_basics/services/navigation_service.dart';
import 'managers/dialog_manager.dart';
import 'routes/router.dart';
import 'locator.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _app = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'firebase_basics',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 9, 202, 172),
        backgroundColor: Color.fromARGB(255, 26, 27, 30),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
            ),
      ),
      home: FutureBuilder(
        future: _app,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("You have an ERROR !! ${snapshot.error.toString()}");
            return Text("Something went Wrog !!!");
          } else if (snapshot.hasData) {
            return SignUpView();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
