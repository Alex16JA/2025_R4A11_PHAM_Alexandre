import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/constants.dart';
import 'viewmodels/counter_viewmodel.dart';
import 'views/home_view.dart';
import 'views/second_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}
