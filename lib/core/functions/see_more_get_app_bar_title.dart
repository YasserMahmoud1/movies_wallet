import '../../manager.dart';

String getSeeMoreTitle(SeeMoreModes mode) {
  switch (mode) {
    case SeeMoreModes.trending:
      return "Trending";
    case SeeMoreModes.popular:
      return "Popular";
    case SeeMoreModes.nowInTheaters:
      return "Now In Theaters";
    default:
      return "dafault";
  }
}
