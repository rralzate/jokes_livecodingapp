import 'package:flutter/material.dart';
import 'features/jokes/presentation/pages/jokes_page.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const JokesPage(),
      },
    );
  }
}
