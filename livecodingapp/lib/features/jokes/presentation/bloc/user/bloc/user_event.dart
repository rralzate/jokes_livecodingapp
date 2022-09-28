part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object> get props => [];
}

class OnLoadJokes extends UserEvent {
  final JokesEntity jokesEntity;

  const OnLoadJokes(this.jokesEntity);
}

class ErrorEvent extends UserEvent {
  final String message;

  const ErrorEvent(this.message);
}

class OnGetstreamjokesEntity extends UserEvent {
  final Stream<List<JokesEntity>>? streamjokesEntity;

  const OnGetstreamjokesEntity(this.streamjokesEntity);
}

class OnIsLoading extends UserEvent {
  final bool isLoading;

  const OnIsLoading(this.isLoading);
}

class OnCount extends UserEvent {
  final int counter;

  const OnCount(this.counter);
}
