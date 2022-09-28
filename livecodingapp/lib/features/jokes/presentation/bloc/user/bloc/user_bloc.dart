import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:livecodingapp/core/usescases/usescases.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../domain/entities/jokes_entity.dart';
import '../../../../domain/usescases/get_jokes.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetJokes getJokes;

  final StreamController<List<JokesEntity>> _jokesStreamController =
      StreamController.broadcast();

  Stream<List<JokesEntity>> get jokesStream => _jokesStreamController.stream;

  List<JokesEntity> listJoke = <JokesEntity>[];
  List<int> list = <int>[];
  static const int jokesNumber = 20;

  UserBloc({
    required this.getJokes,
  }) : super(const UserState()) {
    on<OnLoadJokes>(
        (event, emit) => emit(state.copyWith(jokesEntity: event.jokesEntity)));

    on<OnGetstreamjokesEntity>((event, emit) =>
        emit(state.copyWith(streamjokesEntity: event.streamjokesEntity)));

    on<ErrorEvent>(
        (event, emit) => emit(state.copyWith(mensaje: event.message)));

    on<OnIsLoading>(
        (event, emit) => emit(state.copyWith(isLoading: event.isLoading)));

    on<OnCount>((event, emit) => emit(state.copyWith(count: event.counter)));
  }

  int get getJokesNumber {
    return jokesNumber;
  }

  Future getJokesAll() async {
    final result = await getJokes(NoParams());

    result.fold((failure) => ErrorEvent(_mapFailureToMessage(failure)),
        (response) async {
      _jokesStreamController.add(response);
      add(OnGetstreamjokesEntity(jokesStream));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected error';
    }
  }
}
