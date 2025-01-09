# Tic-Tac-Toe Game

A simple and visually appealing **Tic-Tac-Toe game** built using **Flutter**. This project demonstrates how to design and develop a classic game with a focus on UI and game logic, using Flutter's widgets and tools.

---

## Features
- 🎮 **Interactive Gameplay**: Play against another player locally.
- 🖼️ **Custom Assets**: High-quality custom assets for the board and pieces (X and O).
- 📱 **Responsive Design**: Works on mobile, web, and desktop.
- 🌟 **Beginner-Friendly Codebase**: Ideal for those learning Flutter and Dart.

---

## Getting Started

### Prerequisites
To run this project, ensure you have the following installed:
- Flutter SDK (version 3.10 or later)
- Dart SDK
- A code editor, such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/cypriankoech/tictactoe.git
   cd tictactoe
2. Install the dependencies:
   ```bash
   flutter pub get
3. Run the project:
   ```bash
   flutter run

# How to Play
1. Open the game on your device or browser.
2. Take turns placing X or O on the board.
3. The first player to align three Xs or Os horizontally, vertically, or diagonally wins.
4. If the board is filled without any winner, the game ends in a draw.

# Project Structure
tictactoe/
├── assets/         # Custom assets for the board and pieces
├── lib/            # Main Flutter application files
│   ├── main.dart   # Entry point for the application
│   ├── board.dart  # Widget for rendering the game board
│   ├── game_logic.dart  # Game mechanics and logic
├── pubspec.yaml    # Dependencies and project configuration
