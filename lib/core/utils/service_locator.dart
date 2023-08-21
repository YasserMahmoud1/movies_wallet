import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_wallet/core/utils/api_service.dart';
import 'package:movies_wallet/features/home/data/repos/home_repo/home_repo_imp.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerFactory<HomeRepoImpl>(()=>
    HomeRepoImpl(getIt.get<ApiService>()),
  );


}
