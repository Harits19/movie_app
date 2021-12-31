part of 'auth_bloc_cubit.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

class AuthBlocInitialState extends AuthBlocState {}

class AuthBlocLoadingState extends AuthBlocState {}

class AuthBlocAuthenticatedState extends AuthBlocState {
  final String text;
  AuthBlocAuthenticatedState(this.text);

  @override
  List<Object> get props => [text];
}

class AuthBlocUnauthenticatedState extends AuthBlocState {}

class AuthBlocErrorState extends AuthBlocState {
  final String error;

  AuthBlocErrorState(this.error);

  @override
  List<Object> get props => [error];
}
