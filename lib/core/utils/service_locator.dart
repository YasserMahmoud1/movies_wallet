import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_wallet/core/utils/api_service.dart';
import 'package:movies_wallet/features/actor_details/data/repos/actor_repo_imp.dart';
import 'package:movies_wallet/features/home/data/repos/home_repo/home_repo_imp.dart';
import 'package:movies_wallet/features/home/data/repos/search_repo/search_repo_impl.dart';
import 'package:movies_wallet/features/see_more/data/repos/see_more_repo/see_more_repo_impl.dart';

import '../../features/home/data/repos/saved_repo/saved_repo_impl.dart';
import '../../features/movie_details/data/repos/movie_details_repo_impl.dart';
import 'database_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<DatabaseService>(DatabaseService());

  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<SearchRepoImpl>(
    () => SearchRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<SeeMoreRepoImpl>(
    () => SeeMoreRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<MovieDetailsRepoImpl>(
    () => MovieDetailsRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<ActorRepoImpl>(
    () => ActorRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<SavedRepoImpl>(
    () => SavedRepoImpl(getIt.get<DatabaseService>()),
  );
}
