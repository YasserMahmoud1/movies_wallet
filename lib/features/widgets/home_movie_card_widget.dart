import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_wallet/manager.dart';

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
      borderRadius: BorderRadius.circular(ConstManager.universalBorderRadius),
      child: SizedBox(
        height: ConstManager.homeMovieCardHeight,
        width: ConstManager.homeMovieCardWidth,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "${ConstManager.posterURlPrefix}${_movie.posterPath}"))),
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
                  padding: const EdgeInsets.all(
                      ConstManager.homeMovieCardRatingPadding),
                  child: Rating(_movie.voteAverage),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(ConstManager.universalPadding4),
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
                              ?.copyWith(color: Colors.white.withOpacity(ConstManager.movieDetailsCardOpacity))),
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
