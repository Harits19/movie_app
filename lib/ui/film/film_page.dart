import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majootestcase/bloc/auth_bloc/auth_bloc_cubit.dart';

class FilmPage extends StatelessWidget {
  const FilmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Log Out"),
          onPressed: () {
            final authRead = context.read<AuthBlocCubit>();
            authRead.logoutUser();
          },
        ),
      ),
    );
  }
}
