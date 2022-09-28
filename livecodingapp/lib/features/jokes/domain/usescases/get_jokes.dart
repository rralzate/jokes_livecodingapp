import 'package:livecodingapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:livecodingapp/core/usescases/usescases.dart';
import 'package:livecodingapp/features/jokes/domain/entities/jokes_entity.dart';
import 'package:livecodingapp/features/jokes/domain/repositories/jokes_repository.dart';

class GetJokes implements UseCase<List<JokesEntity>, NoParams> {
  final JokesRepository jokesRepository;

  GetJokes(this.jokesRepository);

  @override
  Future<Either<Failure, List<JokesEntity>>> call(NoParams params) {
    return jokesRepository.getJokes();
  }
}
