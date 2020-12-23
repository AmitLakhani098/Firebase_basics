import 'package:firebase_basics/ui/shared/ui_helpers.dart';
import 'package:firebase_basics/ui/widgets/busy_button.dart';
import 'package:firebase_basics/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:firebase_basics/ui/views/signup/signup_view_model.dart';
import '../../widgets/expansion_list.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 38,
                    ),
                  ),
                  verticalSpaceLarge,
                  // TODO: Add additional user data here to save (episode 2)

                  InputField(
                    placeholder: 'Full Name',
                    controller: fullnameController,
                  ),
                  verticalSpaceSmall,

                  InputField(
                    placeholder: 'Email',
                    controller: emailController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Password',
                    password: true,
                    controller: passwordController,
                    additionalNote:
                        'Password has to be a minimum of 6 characters.',
                  ),
                  verticalSpaceSmall,
                  ExpansionList(
                    items: ["Admin", "User"],
                    title: model.selectedRole,
                    onItemSelected: model.setSelectedRole,
                  ),
                  verticalSpaceLarge,
                  // DropdownButton(
                  //   onChanged: (newRole) {
                  //     model.setSelectedRole(newRole);
                  //   },
                  //   value: model.selectedRole,
                  //   items: model.role.map<DropdownMenuItem>((String value) {
                  //     return DropdownMenuItem(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  // ),

                  // ListView.builder(itemBuilder: null),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BusyButton(
                        title: 'Sign Up',
                        busy: model.busy,
                        onPressed: () {
                          // TODO: Perform firebase login here
                          model.signUp(
                            email: emailController.text,
                            password: passwordController.text,
                            fullName: fullnameController.text,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
