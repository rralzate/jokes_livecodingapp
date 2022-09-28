import 'package:livecodingapp/core/error/exceptions.dart';
import 'package:livecodingapp/features/jokes/data/datasources/jokes_remote_datasources.dart';
import 'package:livecodingapp/features/jokes/domain/entities/jokes_entity.dart';
import 'package:livecodingapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:livecodingapp/features/jokes/domain/repositories/jokes_repository.dart';

class JokesReposirotyImpl implements JokesRepository {
  final JokesRemoteDataSource jokesRemoteDataSource;

  JokesReposirotyImpl({
    required this.jokesRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<JokesEntity>>> getJokes() async {
    try {
      List<JokesEntity> listJokesEntity = <JokesEntity>[];

      for (int i = 1; i <= 20; i++) {
        listJokesEntity.add(await jokesRemoteDataSource.getJokes());
      }

      return Right(listJokesEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
