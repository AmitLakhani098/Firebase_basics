import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'startup_view_model.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartupViewModel>.withConsumer(
      onModelReady: (model) => model.handelStartupLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Startup page"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 300,
                height: 150,
                child: Image.asset('assets/images/icon_large.png'),
              ),
              CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Color(0xff19c7c1)),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
