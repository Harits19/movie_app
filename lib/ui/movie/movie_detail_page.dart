import 'package:flutter/material.dart';
import 'package:majootestcase/common/widget/movie_view.dart';
import 'package:majootestcase/models/movie_response.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final imageUrl = movie.imageMovie?.imageUrl;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 204.8,
              child: (imageUrl?.isEmpty ?? true)
                  ? null
                  : Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(movie.title ?? ""),
                  Text((movie.year ?? "").toString()),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...(movie.listSeries ?? []).map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MovieView(
                              imageUrl: e.imageMovie?.imageUrl,
                              title: e.title,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
