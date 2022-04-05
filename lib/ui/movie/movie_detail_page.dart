import 'package:flutter/material.dart';
import 'package:majootestcase/common/styles/styles.dart';
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    movie.title ?? "",
                    style: KStyle.text.bold24w900,
                  ),
                  Text(
                    (movie.year ?? "").toString(),
                    style: KStyle.text.bold16w900,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ...(movie.listSeries ?? []).map(
                    (e) => MovieView(
                      imageUrl: e.imageMovie?.imageUrl,
                      title: e.title,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
