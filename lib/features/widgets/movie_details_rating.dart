import 'package:flutter/material.dart';

import '../../manager.dart';
import 'move_details_card_with_obacity.dart';

class MovieDetailsRating extends StatelessWidget {
  const MovieDetailsRating(
    this.movieRating,{
    super.key,
  });

  final double movieRating;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MovieDetailsCardWithOpacity(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                
                Padding(
                  padding: const EdgeInsets.only(left: ConstManager.universalPadding4),
                  child: Text(
                    movieRating.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: ConstManager.universalPadding4),
              child: Text("(500000)"),
            ),
          ],
        ),
      ),
    );
  }
}
