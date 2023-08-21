import 'package:flutter/material.dart';

import 'movie_card_with_opacity.dart';

class MovieDetailsRating extends StatelessWidget {
  const MovieDetailsRating({
    super.key,
    required this.movieRating,
  });

  final double movieRating;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MovieDetailsCardWithOpacity(
        child: Column(
          children: [
            Text(
              "Rating:",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 48,
                ),
                const SizedBox(width: 4),
                Text(
                  movieRating.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
