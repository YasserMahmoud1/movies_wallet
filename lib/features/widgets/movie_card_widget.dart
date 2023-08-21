import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../movie_details/data/models/movie_model.dart';
import 'rating_widget.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
    this._movie, {
    super.key,
  });

  final Movie _movie;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 240,
        width: 160,
        child: Stack(
          children: [
            Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "https://image.tmdb.org/t/p/w500${_movie.posterPath}"))),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                )),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Rating(_movie.voteAverage),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 2),
                      Text(_movie.releaseDate.substring(0, 4),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white.withOpacity(0.5))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
