import 'package:flutter/material.dart';
import 'package:majootestcase/bloc/auth_bloc/auth_bloc_cubit.dart';
import 'package:majootestcase/common/widget/custom_button.dart';
import 'package:majootestcase/common/widget/text_form_field.dart';
import 'package:majootestcase/models/user.dart';
import 'package:majootestcase/ui/extra/input_email_view.dart';
import 'package:majootestcase/ui/extra/input_password_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majootestcase/utils/function_helper.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextController();
  final passwordController = TextController();
  final usernameController = TextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBlocCubit, AuthBlocState>(
        listener: (contet, state) {
          if (state is AuthBlocAuthenticatedState) {
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputEmailView(
                    controller: emailController,
                  ),
                  InputPasswordView(
                    controller: passwordController,
                  ),
                  CustomTextFormField(
                    controller: usernameController,
                    label: "Username",
                    hint: "John",
                    mandatory: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<AuthBlocCubit, AuthBlocState>(
                      builder: (context, state) {
                    if (state is AuthBlocLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                      text: "Register",
                      onPressed: handleRegister,
                    );
                  }),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleRegister() async {
    final authRead = context.read<AuthBlocCubit>();
    final _email = emailController.value;
    final _password = passwordController.value;
    final _username = usernameController.value;

    if (formKey.currentState?.validate() == true &&
        _email != null &&
        _password != null &&
        _username != null) {
      User user = User(
        email: _email,
        password: _password,
        username: _username,
      );
      authRead.registerUser(user);
    }
  }
}
