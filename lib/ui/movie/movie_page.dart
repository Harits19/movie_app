import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majootestcase/bloc/auth_bloc/auth_bloc_cubit.dart';
import 'package:majootestcase/bloc/movie_bloc/movie_bloc_cubit.dart';
import 'package:majootestcase/common/widget/movie_view.dart';
import 'package:majootestcase/ui/movie/movie_detail_page.dart';
import 'package:majootestcase/utils/function_helper.dart';
import 'package:majootestcase/utils/navigator_helper.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<MovieBlocCubit, MovieBlocState>(
          listener: (context, state) {
            if (state is MovieBlocErrorState) {
              FunctionHelper.snackBar(context, state.error);
            }
          },
          child: BlocBuilder<MovieBlocCubit, MovieBlocState>(
              builder: (context, state) {
            return (state is MovieBlocLoadingState)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      if (state is MovieBlocLoadedState)
                        ...(state.data.listMovie ?? []).map(
                          (e) => MovieView(
                            title: e.title,
                            imageUrl: e.imageMovie?.imageUrl,
                            onTap: () {
                              NavigatorHelper.push(
                                context,
                                MovieDetailPage(
                                  movie: e,
                                ),
                              );
                            },
                          ),
                        ),
                      if (state is MovieBlocErrorState) ...[
                        SizedBox(
                          height: 16,
                        ),
                        Icon(Icons.signal_cellular_connected_no_internet_0_bar),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text("Refresh"),
                            onPressed: () {
                              final movieRead = context.read<MovieBlocCubit>();
                              movieRead.getListMovie();
                            },
                          ),
                        ),
                      ],
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text("Log Out"),
                          onPressed: () {
                            final authRead = context.read<AuthBlocCubit>();
                            authRead.logoutUser();
                          },
                        ),
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
