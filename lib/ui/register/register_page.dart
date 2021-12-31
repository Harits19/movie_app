import 'package:flutter/material.dart';
import 'package:majootestcase/common/widget/custom_button.dart';
import 'package:majootestcase/ui/extra/input_email_view.dart';
import 'package:majootestcase/ui/extra/input_password_view.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputEmailView(),
                InputPasswordView(),
                SizedBox(
                  height: 16,
                ),
                CustomButton(
                  text: "Register",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
