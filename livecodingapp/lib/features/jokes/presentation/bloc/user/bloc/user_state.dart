part of 'user_bloc.dart';

class UserState extends Equatable {
  final JokesEntity? jokesEntity;
  final Stream<List<JokesEntity>>? streamjokesEntity;
  final String? mensaje;
  final bool isLoading;
  final int count;

  const UserState({
    this.jokesEntity,
    this.mensaje,
    this.streamjokesEntity,
    this.isLoading = false,
    this.count = 0,
  });

  UserState copyWith({
    JokesEntity? jokesEntity,
    String? mensaje,
    Stream<List<JokesEntity>>? streamjokesEntity,
    bool? isLoading,
    int? count,
  }) =>
      UserState(
        jokesEntity: jokesEntity ?? this.jokesEntity,
        mensaje: mensaje ?? this.mensaje,
        streamjokesEntity: streamjokesEntity ?? this.streamjokesEntity,
        isLoading: isLoading ?? this.isLoading,
        count: count ?? this.count,
      );

  @override
  List<Object?> get props => [
        jokesEntity,
        mensaje,
        streamjokesEntity,
        isLoading,
        count,
      ];
}
