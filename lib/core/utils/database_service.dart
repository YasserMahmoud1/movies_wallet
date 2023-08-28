import 'package:sqflite/sqflite.dart';


class DatabaseService {
  static Database? _db;


  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _useDatabase();
    return _db!;
  }

  Future<Database> _useDatabase() async {
    return await openDatabase('saved_movies.db', version: 1,
        onCreate: (database, version) async {
      await database.execute("""
        CREATE TABLE "genres" (
          "genre_id"	INTEGER,
          "movie_id"	INTEGER
        )   
      """);

      await database.execute("""
        CREATE TABLE "movies" (
          "backdrop_path"	TEXT,
          "poster_path"	TEXT,
          "id"	INTEGER,
          "overview"	TEXT,
          "release_date"	NUMERIC,
          "vote_average"	NUMERIC,
          "title"	TEXT,
          "vote_count"	INTEGER,
          PRIMARY KEY("id")
        )
      """);
      print('Database created');
    }, onOpen: (database) {
      print('Databese opend');
    });
  }


}
