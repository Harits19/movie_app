import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majootestcase/bloc/auth_bloc/auth_bloc_cubit.dart';
import 'package:majootestcase/bloc/home_bloc/home_bloc_cubit.dart';
import 'package:majootestcase/common/widget/custom_button.dart';
import 'package:majootestcase/common/widget/text_form_field.dart';
import 'package:majootestcase/models/user.dart';
import 'package:majootestcase/ui/extra/input_email_view.dart';
import 'package:majootestcase/ui/extra/input_password_view.dart';
import 'package:majootestcase/ui/home_bloc/home_bloc_screen.dart';
import 'package:majootestcase/ui/register/register_page.dart';
import 'package:majootestcase/utils/navigator_helper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _emailController = TextController();
  final _passwordController = TextController();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBlocCubit, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthBlocLoggedInState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (context) => HomeBlocCubit()..fetchingData(),
                  child: HomeBlocScreen(),
                ),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 75, left: 25, bottom: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // color: colorBlue,
                ),
              ),
              Text(
                'Silahkan login terlebih dahulu',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 9,
              ),
              _form(),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Login',
                onPressed: handleLogin,
                height: 100,
              ),
              // ElevatedButton(
              //     onPressed: () async {
              //       // final _email = "h1@email.com";
              //       // await userProvider.insert(
              //       //     User(email: _email, username: "123", password: "123"));
              //       // final _user = await userProvider.getUser(_email);
              //       // print(_user?.username.toString());

              //       // final affectedRow = await userProvider.delete(_email);
              //       // print({affectedRow});
              //     },
              //     child: Text("Database")),
              SizedBox(
                height: 50,
              ),
              _register(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputEmailView(
            controller: _emailController,
          ),
          InputPasswordView(
            controller: _passwordController,
          ),
        ],
      ),
    );
  }

  Widget _register() {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () async {
          NavigatorHelper.push(context, RegisterPage());
        },
        child: RichText(
          text: TextSpan(
              text: 'Belum punya akun? ',
              style: TextStyle(color: Colors.black45),
              children: [
                TextSpan(
                  text: 'Daftar',
                ),
              ]),
        ),
      ),
    );
  }

  void handleLogin() async {
    final authRead = context.read<AuthBlocCubit>();
    final String? _email = _emailController.value;
    final String? _password = _passwordController.value;
    if (formKey.currentState?.validate() == true &&
        _email != null &&
        _password != null) {
      User user = User(
        email: _email,
        password: _password,
      );
      authRead.loginUser(user);
    }
  }
}
