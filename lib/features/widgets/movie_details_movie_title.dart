import 'package:flutter/material.dart';

import '../../manager.dart';

class MovieDetailsMovieTitle extends StatelessWidget {
  const MovieDetailsMovieTitle({
    super.key,
    required this.movieName,
  });

  final String movieName;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: ColorManager.lightBlacks.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Movie Title:",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                movieName,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
