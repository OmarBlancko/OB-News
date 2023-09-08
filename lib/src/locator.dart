import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app/src/utils/constants/app_strings.dart';

import 'data/data_sources/local/app_database.dart';
import 'data/data_sources/remote/news_api_service.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/repositories/api_repository_impl.dart';
import 'domain/repositories/database_repository.dart';
import 'domain/repositories/database_repository_impl.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();  /// initialize database

  locator.registerSingleton<AppDatabase>(db); /// register its service (act as service)

  locator.registerSingleton<DatabaseRepository>(
      DatabaseRepositoryImpl(locator<AppDatabase>()));

  // dio.interceptors.add(AwesomeDioInterceptor());
  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<NewsApiService>(NewsApiService(locator<Dio>()));

  locator.registerSingleton<ApiRepository>(
      ApiRepositoryImpl(locator<NewsApiService>()));
}
