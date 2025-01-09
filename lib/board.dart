import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'game_logic.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  TicTacToeBoardState createState() => TicTacToeBoardState();
}

class TicTacToeBoardState extends State<TicTacToeBoard> {
  final List<String?> _board = List.filled(9, null);

  // Reset the board
  void _resetBoard() {
    setState(() {
      _board.fillRange(0, _board.length, null);
      GameLogic.currentPlayer = 'X';
    });
  }

  // Show a dialog for win/draw
void _showEndDialog(String title, String message) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dialog from closing when tapping outside
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              _resetBoard(); // Reset the board for a new game
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // (Dynamic board and cell size logic remains the same)
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double boardSize =
        (screenWidth < screenHeight ? screenWidth * 0.9 : screenHeight * 0.9)
            .clamp(150.0, double.infinity);
    final double cellSize = boardSize / 3;
    final double leftOffset = (screenWidth - boardSize) / 2;
    final double topOffset = (screenHeight - boardSize) / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: topOffset,
              left: leftOffset,
              child: SvgPicture.asset(
                'assets/Board.svg',
                width: boardSize,
                height: boardSize,
              ),
            ),
            ...List.generate(9, (index) {
              final int row = index ~/ 3;
              final int col = index % 3;
              final double top = topOffset + row * cellSize;
              final double left = leftOffset + col * cellSize;

              return Positioned(
                top: top,
                left: left,
                child: GestureDetector(
                  onTap: () {
                    if (_board[index] == null) {
                      setState(() {
                        _board[index] = GameLogic.currentPlayer;

                        // Check for a winner
                        final winner = GameLogic.checkWinner(_board);
                        if (winner != null) {
                          _showEndDialog('We have a winner!', '$winner wins!');
                        } else if (GameLogic.isDraw(_board)) {
                          _showEndDialog(
                              'It\'s a draw!', 'No winner this time.');
                        } else {
                          GameLogic.switchPlayer();
                        }
                      });
                    }
                  },
                  child: Container(
                    width: cellSize,
                    height: cellSize,
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: _board[index] == null
                        ? null
                        : SvgPicture.asset(
                            'assets/${_board[index]}.svg',
                            width: cellSize * 0.8,
                            height: cellSize * 0.8,
                          ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
