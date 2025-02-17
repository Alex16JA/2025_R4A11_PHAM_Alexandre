import 'package:flutter/material.dart';
import 'GameView.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Démineur - Accueil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choisissez la difficulté', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            CustomButton(
              text: 'Facile',
              onPressed: () => _startGame(context, 10, 8, 10),
            ),
            CustomButton(
              text: 'Moyen',
              onPressed: () => _startGame(context, 18, 14, 40),
            ),
            CustomButton(
              text: 'Difficile',
              onPressed: () => _startGame(context, 24, 20, 99),
            ),
          ],
        ),
      ),
    );
  }

  void _startGame(BuildContext context, int ligne, int colonne, int bombs) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameView(
          ligne: ligne,
          colonne: colonne,
          bombs: bombs,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      ),
    );
  }
}