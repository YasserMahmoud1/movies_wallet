import '../../../../movie_details/data/models/movie_model.dart';

abstract class SavedRepo {
  Future<List<Movie>> getSavedMovies();
  Future<void> deleteMovie(int movieID);
  Future<void> saveMovie(Movie movie);
  Future<bool> isSaved(int movieID);
}
