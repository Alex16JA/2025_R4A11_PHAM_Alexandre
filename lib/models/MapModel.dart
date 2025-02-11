import 'dart:math';
import 'CaseModel.dart';

class MapModel {

  int nbLine = 0;
  int nbCol = 0;
  int nbBomb = 0;
  List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();

  void initCases() {
    _cases = List.generate(nbLine,
          (i) => List.generate(nbCol, (j) => CaseModel()),
    );
  }

  void initBomb() {
    Random random = Random();
    int bombePlacer = 0;

    while (bombePlacer < nbBomb) {
      int x = random.nextInt(nbLine);
      int y = random.nextInt(nbCol);
      if (!_cases[x][y].hasBomb) {
        _cases[x][y].hasBomb = true;
        bombePlacer++;
      }
    }
  }

  bool tryGetCase(int x, int y) {
    return x >= 0 && x < nbLine && y >= 0 && y < nbCol;
  }

  int computeNumber(int caseX, int caseY) {
    int compteurBomb = 0;
    for (int x = -1; x <= 1; x++) {
      for (int y = -1; y <= 1; y++) {
        if (x == 0 && y == 0) continue;
        if (tryGetCase(caseX + x, caseY + y)) {
          CaseModel caseAutour = _cases[caseX + x][caseY + y];
          if (caseAutour.hasBomb) {
            compteurBomb++;
          }
        }
      }
    }
    return compteurBomb;
  }

  void initNumbers() {
    for (int i = 0; i < nbLine; i++) {
      for (int j = 0; j < nbCol; j++) {
        if (!_cases[i][j].hasBomb) {
          _cases[i][j].number = computeNumber(i, j);
        }
      }
    }
  }

  void generateMap(int ligne, int colonne, int bombs) {
    nbLine = ligne;
    nbCol = colonne;
    nbBomb = bombs;
    initCases();
    initBomb();
    initNumbers();
  }

  void reveal(int caseX, int caseY) {

    CaseModel caseEnCours = _cases[caseX][caseY];
    if (!caseEnCours.hidden) return;
    caseEnCours.hidden = false;

    if (caseEnCours.hasBomb) {
      explode(caseX, caseY);
    }
    else if (caseEnCours.number == 0) {
      for (int x = -1; x <= 1; x++) {
        for (int y = -1; y <= 1; y++) {
          if (x == 0 && y == 0) continue;

          int newX = caseX + x;
          int newY = caseY + y;

          if (tryGetCase(newX, newY) && _cases[newX][newY].hidden) {
            reveal(newX, newY);
          }
        }
      }
    }
  }

  void revealAll() {
    for (int i = 0; i < nbLine; i++) {
      for (int j = 0; j < nbCol; j++) {
        _cases[i][j].hidden = false;
      }
    }
  }

  void explode(int caseX, int caseY) {
    _cases[caseX][caseY].hasExploded = true;
    revealAll();
  }

  void toggleFlag(int x, int y) {
    _cases[x][y].hasFlag = !_cases[x][y].hasFlag;
  }






}