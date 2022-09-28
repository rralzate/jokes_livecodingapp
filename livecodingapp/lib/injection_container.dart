import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:livecodingapp/features/jokes/data/datasources/jokes_remote_datasources.dart';
import 'package:livecodingapp/features/jokes/data/repositories/jokes_repository_imp.dart';
import 'package:livecodingapp/features/jokes/domain/repositories/jokes_repository.dart';
import 'package:livecodingapp/features/jokes/presentation/bloc/user/bloc/user_bloc.dart';

import 'features/jokes/domain/usescases/get_jokes.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => UserBloc(
        getJokes: sl(),
      ));

  sl.registerLazySingleton(() => GetJokes(
        sl(),
      ));

  sl.registerLazySingleton<JokesRepository>(() => JokesReposirotyImpl(
        jokesRemoteDataSource: sl(),
      ));

  sl.registerLazySingleton<JokesRemoteDataSource>(
      () => JokesRemoteDataSourceImpl(dioClient: sl()));

  sl.registerLazySingleton(() => Dio());
}
