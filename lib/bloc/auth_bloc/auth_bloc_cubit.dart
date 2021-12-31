import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:majootestcase/main.dart';
import 'package:majootestcase/models/user.dart';
import 'package:majootestcase/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_bloc_state.dart';

class AuthBlocCubit extends Cubit<AuthBlocState> {
  AuthBlocCubit() : super(AuthBlocInitialState());

  void fetchHistoryLogin() async {
    emit(AuthBlocLoadingState());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLoggedIn = sharedPreferences.getBool(SharedPrefKey.isLoggedIn);
    if (isLoggedIn == null) {
      emit(AuthBlocUnauthenticatedState());
    } else {
      if (isLoggedIn) {
        emit(AuthBlocAuthenticatedState());
      } else {
        emit(AuthBlocUnauthenticatedState());
      }
    }
  }

  void loginUser(User user) async {
    emit(AuthBlocLoadingState());
    final result = await userProvider.getUser(user.email);
    if (result != null) {
      await isLoginSaveLocal();
      emit(AuthBlocAuthenticatedState());
    } else {
      emit(AuthBlocErrorState("User dont exist"));
    }
  }

  void logoutUser() async {
    emit(AuthBlocLoadingState());
    await isLoginSaveLocal(isLogin: false);
    emit(AuthBlocUnauthenticatedState());
  }

  void registerUser(User user) async {
    emit(AuthBlocLoadingState());
    try {
      await userProvider.insert(user);
      await isLoginSaveLocal();
      emit(AuthBlocAuthenticatedState());
    } catch (e) {
      print({AuthBlocCubit, "error", e.toString()});
      emit(AuthBlocErrorState(e.toString()));
    }
  }

  isLoginSaveLocal({bool isLogin = true}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(SharedPrefKey.isLoggedIn, isLogin);
  }
}
