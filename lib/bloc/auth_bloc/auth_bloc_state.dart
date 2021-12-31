part of 'auth_bloc_cubit.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

class AuthBlocInitialState extends AuthBlocState {}

class AuthBlocLoadingState extends AuthBlocState {}

class AuthBlocAuthenticatedState extends AuthBlocState {}

class AuthBlocUnauthenticatedState extends AuthBlocState {}

class AuthBlocSuccesState extends AuthBlocState {}

class AuthBlocLoadedState extends AuthBlocState {
  final User data;

  AuthBlocLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class AuthBlocErrorState extends AuthBlocState {
  final String error;

  AuthBlocErrorState(this.error);

  @override
  List<Object> get props => [error];
}
