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
    } else if (_mapModel.cases[x][y].number == 0) {
      _mapModel.revealAdjacents(x, y);
    }
  }

  void onLongPress(int x, int y) {
    _mapModel.toggleFlag(x, y);
  }

  Widget getIcon(int x, int y) {
    CaseModel caseActuel = _mapModel.cases[x][y];

    if (caseActuel.hasFlag) {
      return Image.asset('../../assets/flag.png', height: 40);
    }

    if (!caseActuel.hidden) {
      if (caseActuel.hasBomb) {
        if (caseActuel.hasExploded) {
          return Image.asset('../../assets/boom.png', height: 40);
        } else {
          return Image.asset('../../assets/bomb.png', height: 40);
        }
      } else {
        switch (caseActuel.number) {
          case 0:
            return Image.asset('../../assets/0.png', height: 40);
          case 1:
            return Image.asset('../../assets/1.png', height: 40);
          case 2:
            return Image.asset('../../assets/2.png', height: 40);
          case 3:
            return Image.asset('../../assets/3.png', height: 40);
          case 4:
            return Image.asset('../../assets/4.png', height: 40);
          case 5:
            return Image.asset('../../assets/5.png', height: 40);
          case 6:
            return Image.asset('../../assets/6.png', height: 40);
          case 7:
            return Image.asset('../../assets/7.png', height: 40);
          case 8:
            return Image.asset('../../assets/8.png', height: 40);
          default:
            return Image.asset('../../assets/0.png', height: 40);
        }
      }
    }

    return Image.asset('../../assets/cache.png', height: 40);
  }

  bool checkDefaite() {
    for (int i = 0; i < _mapModel.nbLine; i++) {
      for (int j = 0; j < _mapModel.nbCol; j++) {
        if (_mapModel.cases[i][j].hasExploded) {
          return true;
        }
      }
    }
    return false;
  }

  bool checkVictoire() {
    for (int i = 0; i < _mapModel.nbLine; i++) {
      for (int j = 0; j < _mapModel.nbCol; j++) {
        if (!_mapModel.cases[i][j].hasBomb && _mapModel.cases[i][j].hidden) {
          return false;
        }
      }
    }
    return true;
  }
}