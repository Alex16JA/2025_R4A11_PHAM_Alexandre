import 'package:flutter/material.dart';
import '../viewmodels/GameViewModel.dart';

class MapButton extends StatelessWidget {
  final int x;
  final int y;
  final GameViewModel gameViewModel;
  final VoidCallback onReveal;
  const MapButton({
    Key? key,
    required this.x,
    required this.y,
    required this.gameViewModel,
    required this.onReveal, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Case cliquée: ($x, $y)");
        gameViewModel.click(x, y);
        onReveal(); 
      },
      onLongPress: () {
        print("Case long press: ($x, $y)");
        gameViewModel.onLongPress(x, y);
        onReveal();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: gameViewModel.cases[x][y].hidden ? Colors.grey[300] : Colors.white,
        ),
        child: Center(
          child: gameViewModel.getIcon(x, y),
        ),
      ),
    );
  }
}