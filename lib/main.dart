import 'package:flutter/material.dart';
import 'board.dart';

void main() {
  // debugPaintSizeEnabled = true; // Enable visual debugging for gesture areas
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicTacToeBoard(),
    );
  }
}
