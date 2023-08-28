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
        padding: const EdgeInsets.symmetric(horizontal: ConstManager.universalPadding8),
        decoration: BoxDecoration(
          color: ColorManager.lightBlacks.withOpacity(ConstManager.movieDetailsCardOpacity),
          borderRadius: BorderRadius.circular(ConstManager.universalBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: ConstManager.universalPadding16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Movie Title:",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: ConstManager.universalPadding4),
                child: Text(
                  movieName,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
