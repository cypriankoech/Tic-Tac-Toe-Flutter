class GameLogic {
  static String currentPlayer = 'X'; // Current player ('X' or 'O')

  // Switch the current player
  static void switchPlayer() {
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }

  // Check for a winner
  static String? checkWinner(List<String?> board) {
    // Winning combinations (rows, columns, diagonals)
    const List<List<int>> winPatterns = [
      [0, 1, 2], // Top row
      [3, 4, 5], // Middle row
      [6, 7, 8], // Bottom row
      [0, 3, 6], // Left column
      [1, 4, 7], // Middle column
      [2, 5, 8], // Right column
      [0, 4, 8], // Main diagonal
      [2, 4, 6], // Anti-diagonal
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] != null &&
          board[pattern[0]] == board[pattern[1]] &&
          board[pattern[1]] == board[pattern[2]]) {
        return board[pattern[0]]; // Return the winner ('X' or 'O')
      }
    }
    return null; // No winner
  }

  // Check for a draw
  static bool isDraw(List<String?> board) {
    return board.every((cell) => cell != null);
  }
}
