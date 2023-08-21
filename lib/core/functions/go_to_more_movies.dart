import 'package:flutter/material.dart';

import '../../features/see_more/presentation/view/see_more_view.dart';

void goToMoreMovies(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const SeeMoreView()));
}