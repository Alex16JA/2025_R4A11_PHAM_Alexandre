import 'package:flutter/material.dart';
import 'HomeView.dart';

class VictoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Victoire'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Vous avez gagné ! WP WP !', style: TextStyle(fontSize: 24)),
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