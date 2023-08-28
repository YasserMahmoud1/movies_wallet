import 'package:flutter/material.dart';

import '../../features/see_more/presentation/view/see_more_view.dart';
import '../../manager.dart';

void goToMoreMovies(BuildContext context, SeeMoreModes mode) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) =>  SeeMoreView(mode)));
}