import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:majootestcase/models/user.dart';
import 'package:majootestcase/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_bloc_state.dart';

class AuthBlocCubit extends Cubit<AuthBlocState> {
  AuthBlocCubit() : super(AuthBlocInitialState());

  void fetchHistoryLogin() async {
    emit(AuthBlocInitialState());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLoggedIn = sharedPreferences.getBool(SharedPrefKey.isLoggedIn);
    if (isLoggedIn == null) {
      emit(AuthBlocLoginState());
    } else {
      if (isLoggedIn) {
        emit(AuthBlocLoggedInState());
      } else {
        emit(AuthBlocLoginState());
      }
    }
  }

  void loginUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    emit(AuthBlocLoadingState());
    await sharedPreferences.setBool(SharedPrefKey.isLoggedIn, true);
    String data = user.toJson().toString();
    sharedPreferences.setString("user_value", data);
    emit(AuthBlocLoggedInState());
  }
}
