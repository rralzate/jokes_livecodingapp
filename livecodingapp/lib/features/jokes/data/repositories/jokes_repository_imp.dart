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
  Future<Either<Failure, JokesEntity>> getJokes() async {
    try {
      final jokes = await jokesRemoteDataSource.getJokes();

      return Right(jokes);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
