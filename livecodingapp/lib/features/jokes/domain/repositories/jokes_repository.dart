import 'package:dartz/dartz.dart';
import 'package:livecodingapp/features/jokes/domain/entities/jokes_entity.dart';

import '../../../../core/error/failure.dart';

abstract class JokesRepository {
  Future<Either<Failure, JokesEntity>> getJokes();
}
