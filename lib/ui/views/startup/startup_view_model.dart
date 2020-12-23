import 'package:firebase_basics/locator.dart';
import 'package:firebase_basics/services/authentication_service.dart';
import 'package:firebase_basics/services/navigation_service.dart';
import 'package:firebase_basics/ui/views/base_model.dart';
import 'package:firebase_basics/ui/views/home/home_view.dart';
import 'package:firebase_basics/routes/route_names.dart';

class StartupViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handelStartupLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}
