import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_basics/services/navigation_service.dart';
import 'package:firebase_basics/services/dialog_service.dart';
import 'package:firebase_basics/services/authentication_service.dart';
import 'package:firebase_basics/services/firestore_service.dart';

GetIt locator = GetIt.instance;

// two ways.
/*
  1.
     Factory: When you request an instance of the type from the service provider you'll get a new instance everytime.
     Good for registering ViewModels that need to run the same logic on start or that has to be new when the view is opened.

  2.
    Singleton: Singletons can be registered in two ways,
    Provide an implementation upon registration or provide a lamda that will be invoked the first time your instance is requested (LazySingleton).
    The Locator keeps a single instance of your registered type and will always return you that instance.
*/
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerSingleton(() => FirestoreService());
}
