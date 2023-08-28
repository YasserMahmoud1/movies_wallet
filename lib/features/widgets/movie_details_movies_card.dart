import 'package:flutter/material.dart';
import 'package:movies_wallet/features/widgets/rating_widget.dart';

import '../../core/functions/go_to_actor_details.dart';
import '../../manager.dart';
import '../actor_details/data/models/actor_model.dart';
import '../movie_details/data/models/movie_model.dart';

class MovieDetailsMovieCard extends StatelessWidget {
  const MovieDetailsMovieCard(
    this.movie, {
    super.key, 
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: ConstManager.movieDetailsMovieCardHeight,
              width: ConstManager.movieDetailsMovieCardWidth,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(ConstManager.universalBorderRadius),
                image: DecorationImage(
                  image: NetworkImage(
                    movie.posterPath == ''?
                    ConstManager.placeHolderPosterURL:
                    "${ConstManager.posterURlPrefix}${movie.posterPath}",
                  ),
                ),
              ),
            ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(ConstManager.universalPadding4),
                    child: Rating(movie.voteAverage),
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
              top: ConstManager.universalPadding8,
              bottom: ConstManager.universalPadding4),
          child: SizedBox(
            width: ConstManager.movieDetailsMovieCardWidth,
            child: Text(
              movie.title,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class MovieDetailsActorCard extends StatelessWidget {
  const MovieDetailsActorCard(
    this.actor, {
    super.key, 
  });

  final Actor actor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            goToActorDetails(context, actor);
          },
          child: Container(
            height: ConstManager.movieDetailsMovieCardHeight,
            width: ConstManager.movieDetailsMovieCardWidth,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(ConstManager.universalBorderRadius),
              image: DecorationImage(
                image: NetworkImage(
                  actor.profilePathID == ''?
                  ConstManager.placeHolderPosterURL:
                  "${ConstManager.posterURlPrefix}${actor.profilePathID}",
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
              top: ConstManager.universalPadding8,
              bottom: ConstManager.universalPadding4),
          child: SizedBox(
            width: ConstManager.movieDetailsMovieCardWidth,
            child: Text(
              actor.name,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
          Text("(${actor.character})",
              style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
