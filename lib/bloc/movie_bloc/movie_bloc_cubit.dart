import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:majootestcase/models/movie_response.dart';
import 'package:majootestcase/services/api_service.dart';

part 'movie_bloc_state.dart';

class MovieBlocCubit extends Cubit<MovieBlocState> {
  MovieBlocCubit() : super(MovieBlocInitialState());

  void getListMovie() async {
    print({"called ", getListMovie});
    emit(MovieBlocLoadingState());
    await ApiServices.getMovieList(
      onSuccess: (val) {
        print({"result", val.toJson()});
        emit(MovieBlocLoadedState(val));
      },
      onError: (error) {
        emit(MovieBlocErrorState(error));
      },
    );
  }
}
