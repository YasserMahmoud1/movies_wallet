import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_wallet/core/functions/go_to_movie_details.dart';

import '../../manager.dart';
import '../movie_details/data/models/movie_model.dart';
// import '../movie_details/presentation/movie_details_view.dart';
import 'rating_widget.dart';

class MovieTile extends StatelessWidget {
  const MovieTile(
    this._movie, {
    super.key,
    // required this.isMovie,
  });
  // final bool isMovie;
  final Movie _movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          goToMovieDetails(context, _movie);
        },
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.lightBlacks.withOpacity(.5),
            borderRadius: BorderRadius.circular(24),
          ),
          child: SizedBox(
            height: 150,
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        _movie.posterPath == ''
                            ? ConstManager.placeHolderPosterURL
                            : "${ConstManager.posterURlPrefix}${_movie.posterPath}",
                      ),
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          width: double.infinity / 2,
                          child: Text(
                            _movie.title,
                            style: const TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.whites,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _movie.releaseDate == ""
                              ? "Unknown"
                              : _movie.releaseDate.substring(0, 4),
                          style: TextStyle(
                            color: ColorManager.whites.withOpacity(.75),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Rating(_movie.voteAverage),
                            const Spacer(),
                              IconButton(
                                onPressed: () {
                                  print("remove from saved");
                                },
                                icon: const Icon(Icons.bookmark,
                                    color: ColorManager.blues, size: 32),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
