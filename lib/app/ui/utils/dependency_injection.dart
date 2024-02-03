import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../data/network/base_url.dart';
import '../../data/providers/commits_api.dart';
import '../../services/commits_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Dio(BaseOptions(baseUrl: ApiBaseURL.baseUrl)));
  locator.registerLazySingleton(() => CommitsApi());
  locator.registerLazySingleton(() => CommitsService());
}