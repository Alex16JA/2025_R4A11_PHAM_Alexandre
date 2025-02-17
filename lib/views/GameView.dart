import 'package:flutter/material.dart';
import '../viewmodels/GameViewModel.dart';
import '../widgets/MapButton.dart';

class GameView extends StatefulWidget {
  final int ligne;
  final int colonne;
  final int bombs;

  const GameView({
    Key? key,
    required this.ligne,
    required this.colonne,
    required this.bombs,
  }) : super(key: key);

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late GameViewModel gameViewModel; 

  @override
  void initState() {
    super.initState();
    gameViewModel = GameViewModel(); 
    gameViewModel.generateMap(widget.ligne, widget.colonne, widget.bombs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Démineur - ${_getDifficulty()}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                gameViewModel.generateMap(widget.ligne, widget.colonne, widget.bombs);
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dimensions: ${widget.ligne} x ${widget.colonne}'),
                Text('Bombes: ${gameViewModel.nbBomb - _countFlags()}'),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                children: _buildGrid(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TableRow> _buildGrid() {
    List<TableRow> rows = [];
    for (int i = 0; i < gameViewModel.nbLine; i++) {
      List<Widget> cells = [];
      for (int j = 0; j < gameViewModel.nbCol; j++) {
        cells.add(
          TableCell(
            child: MapButton(
              x: i,
              y: j,
              gameViewModel: gameViewModel,
              onReveal: _checkGameStatus,
            ),
          ),
        );
      }
      rows.add(TableRow(children: cells));
    }
    return rows;
  }

  String _getDifficulty() {
    if (widget.ligne == 10 && widget.colonne == 8 && widget.bombs == 10) return 'Facile';
    if (widget.ligne == 18 && widget.colonne == 14 && widget.bombs == 40) return 'Moyen';
    if (widget.ligne == 24 && widget.colonne == 20 && widget.bombs == 99) return 'Difficile';
    return 'Personnalisé';
  }

  int _countFlags() {
    int count = 0;
    for (int i = 0; i < gameViewModel.nbLine; i++) {
      for (int j = 0; j < gameViewModel.nbCol; j++) {
        if (gameViewModel.cases[i][j].hasFlag) {
          count++;
        }
      }
    }
    return count;
  }

  void _checkGameStatus() {
    setState(() {});

    if (gameViewModel.checkDefaite()) {
      Navigator.pushNamed(context, '/gameOver');
    } else if (gameViewModel.checkVictoire()) {
      Navigator.pushNamed(context, '/victory');
    }
  }
}