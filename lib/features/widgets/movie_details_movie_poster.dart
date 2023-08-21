import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailsMoviePoster extends StatelessWidget {
  const MovieDetailsMoviePoster({
    super.key,
    required this.poster,
  });

  final String poster;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 225,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/w500$poster"),
        ),
      ),
    );
  }
}
