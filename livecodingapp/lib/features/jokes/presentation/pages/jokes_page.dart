import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livecodingapp/features/jokes/domain/entities/jokes_entity.dart';
import 'package:livecodingapp/features/jokes/presentation/widgets/custom_card.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart';
import '../bloc/user/bloc/user_bloc.dart';

class JokesPage extends StatelessWidget {
  const JokesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Jokes Test"),
          backgroundColor: AppTheme.primary,
        ),
        body: builBody(context),
      ),
    );
  }
}

BlocProvider<UserBloc> builBody(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<UserBloc>(),
    child: const Jokes(),
  );
}

class Jokes extends StatefulWidget {
  const Jokes({Key? key}) : super(key: key);

  @override
  State<Jokes> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  late UserBloc userBloc;

  @override
  void initState() {
    userBloc = BlocProvider.of<UserBloc>(context);

    super.initState();
  }

  Widget _emptyContainer(BuildContext context) {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.search_sharp,
              color: AppTheme.primary,
              size: 130,
            ),
            Text("Wait...")
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: userBloc,
      builder: (context, UserState state) {
        userBloc.getJokesAll();
        print(state.streamjokesEntity);
        return StreamBuilder(
          stream: state.streamjokesEntity,
          builder: (context, AsyncSnapshot<List<JokesEntity>> snapshot) {
            if (!snapshot.hasData) return _emptyContainer(context);

            final jokes = snapshot.data!;
            userBloc.add(OnCount(jokes.length));

            return ListView.builder(
                itemCount: jokes.length,
                itemBuilder: (_, int index) => _JokeItem(
                      jokesEntity: jokes[index],
                    ));
          },
        );
      },
    );
  }
}

class _JokeItem extends StatefulWidget {
  const _JokeItem({
    Key? key,
    required this.jokesEntity,
  }) : super(key: key);

  final JokesEntity jokesEntity;

  @override
  State<_JokeItem> createState() => __JokeItemState();
}

class __JokeItemState extends State<_JokeItem> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      imageUrl: widget.jokesEntity.iconUrl,
      name: widget.jokesEntity.value,
      existIcon: widget.jokesEntity.existIcon,
    );
  }
}
