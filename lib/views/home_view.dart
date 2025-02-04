import 'package:flutter/material.dart';
import '../widgets/custom_counter.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Image.asset('assets/logo.png', height: 40),
            ),
            const SizedBox(width: 10),
            const Text('Mon Application Flutter'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Vous avez appuyé sur le bouton cette quantité de fois:',
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: CustomCounter(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Aller à la deuxième page'),
            ),
          ],
        ),
      ),
    );
  }
}
