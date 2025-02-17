import 'package:flutter/material.dart';
import 'HomeView.dart';

class GameOverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Over'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Vous avez perdu bahahahhaah !', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            CustomButton(
              text: 'Revenir à l\'accueil',
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}