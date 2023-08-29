import 'package:flutter/material.dart';

import '../../manager.dart';
import 'move_details_card_with_obacity.dart';

class MovieDetailsRating extends StatelessWidget {
  const MovieDetailsRating({
    required this.movieRating,
    required this.numberOfVotes,
    super.key,
  });

  final double movieRating;
  final int numberOfVotes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MovieDetailsCardWithOpacity(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rating:",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: ConstManager.universalPadding4),
                      child: Text(
                        movieRating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Text("($numberOfVotes votes)"),
            ],
          ),
        ),
      ),
    );
  }
}
