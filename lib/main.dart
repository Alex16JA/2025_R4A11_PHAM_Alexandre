import 'package:flutter/material.dart';
import 'views/HomeView.dart';
import 'views/GameView.dart';
import 'views/GameOverView.dart';
import 'views/VictoryView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Démineur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/game': (context) => GameView(
              ligne: 8,
              colonne: 8,
              bombs: 10,
            ),
        '/gameOver': (context) => GameOverView(),
        '/victory': (context) => VictoryView(),
      },
    );
  }
}