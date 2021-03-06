import 'package:majootestcase/bloc/movie_bloc/movie_bloc_cubit.dart';
import 'package:majootestcase/services/sqflite_service.dart';
import 'package:majootestcase/ui/movie/movie_page.dart';
import 'package:majootestcase/ui/login/login_page.dart';
import 'package:majootestcase/utils/function_helper.dart';
import 'bloc/auth_bloc/auth_bloc_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

late UserProvider userProvider;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  userProvider = UserProvider();
  await userProvider.open();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBlocCubit>(
      create: (_) => AuthBlocCubit()..fetchHistoryLogin(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePageScreen(),
      ),
    );
  }
}

class MyHomePageScreen extends StatelessWidget {
  const MyHomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBlocCubit, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthBlocErrorState) {
          FunctionHelper.snackBar(context, state.error);
        }
        if (state is AuthBlocAuthenticatedState) {
          FunctionHelper.snackBar(context, state.text);
        }
      },
      child: BlocBuilder<AuthBlocCubit, AuthBlocState>(
        builder: (context, state) {
          if (state is AuthBlocUnauthenticatedState) {
            return LoginPage();
          }
          if (state is AuthBlocAuthenticatedState) {
            return BlocProvider<MovieBlocCubit>(
              create: (_) => MovieBlocCubit()..getListMovie(),
              lazy: false,
              child: MoviePage(),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
