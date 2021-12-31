part of 'movie_bloc_cubit.dart';

abstract class MovieBlocState extends Equatable {
  const MovieBlocState();

  @override
  List<Object> get props => [];
}

class MovieBlocInitialState extends MovieBlocState {}

class MovieBlocLoadingState extends MovieBlocState {}

class MovieBlocLoadedState extends MovieBlocState {
  final MovieResponse data;

  MovieBlocLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class MovieBlocErrorState extends MovieBlocState {
  final String error;

  MovieBlocErrorState(this.error);

  @override
  List<Object> get props => [error];
}
