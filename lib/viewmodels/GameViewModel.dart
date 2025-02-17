import 'package:flutter/material.dart';
import '../models/MapModel.dart';
import '../models/CaseModel.dart';

class GameViewModel {
  final MapModel _mapModel = MapModel();

  int get nbLine => _mapModel.nbLine;
  int get nbCol => _mapModel.nbCol;
  int get nbBomb => _mapModel.nbBomb;

  List<List<CaseModel>> get cases => _mapModel.cases;

  void generateMap(int ligne, int colonne, int bombs) {
    _mapModel.generateMap(ligne, colonne, bombs);
  }

  void click(int x, int y) {
    if (_mapModel.cases[x][y].hasFlag) return; 

    _mapModel.reveal(x, y);

    if (_mapModel.cases[x][y].hasExploded) {
      _mapModel.revealAll();
    }
  }

  void onLongPress(int x, int y) {
    _mapModel.toggleFlag(x, y);
  }

  Widget getIcon(int x, int y) {
    CaseModel caseActuel = _mapModel.cases[x][y];

    if (caseActuel.hasFlag) {
      return Image.asset('assets/images/flag.png', height: 40);
    }

    if (!caseActuel.hidden) {
      if (caseActuel.hasBomb) {
        if (caseActuel.hasExploded) {
          return Image.asset('assets/images/exploded_bomb.png', height: 40);
        } else {
          return Image.asset('assets/images/bomb.png', height: 40);
        }
      } else {
        switch (caseActuel.number) {
          case 0:
            return Image.asset('assets/images/0.png', height: 40);
          case 1:
            return Image.asset('assets/images/1.png', height: 40);
          case 2:
            return Image.asset('assets/images/2.png', height: 40);
          case 3:
            return Image.asset('assets/images/3.png', height: 40);
          case 4:
            return Image.asset('assets/images/4.png', height: 40);
          case 5:
            return Image.asset('assets/images/5.png', height: 40);
          case 6:
            return Image.asset('assets/images/6.png', height: 40);
          case 7:
            return Image.asset('assets/images/7.png', height: 40);
          case 8:
            return Image.asset('assets/images/8.png', height: 40);
          default:
            return Container(); // Cas par défaut, ne retourne rien
        }
      }
    }

    return Container(); // Case cachée sans drapeau
  }
}