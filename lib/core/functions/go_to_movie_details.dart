import 'package:flutter/material.dart';

import '../../features/movie_details/presentation/movie_details_view.dart';

void goToMovieDetails(BuildContext context) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const MovieDetailsView()));
}