import 'dart:core';
import 'dart:math';
import 'sudokuBoard.dart';
import 'package:flutter/foundation.dart';

class SudokuBoardNotifier extends ChangeNotifier {
  List<List<int>> board = List.generate(9, (i) => List.generate(9, (j) => 0));
  SudokuCell holderCell = new SudokuCell(-1, -1);
  SudokuCell selectedCell = new SudokuCell(-1, -1);

  String getCellValue(int row, int col) {
    if (board[row][col] == 0) {
      return "";
    }
    return board[row][col].toString();
  }

  void changeValue(int i) {
    board[selectedCell.getRow()][selectedCell.getCol()] = i;
    selectedCell = holderCell;
    notifyListeners();
  }

  void clearBoard() {
    board = List.generate(9, (i) => List.generate(9, (j) => 0));
    notifyListeners();
  }

  bool checkRow(int row, int value) {
    for (int i = 0; i < 9; ++i) {
      if (board[row][i] == value) {
        return true;
      }
    }
    return false;
  }

  bool checkCol(int col, int value) {
    for (int i = 0; i < 9; ++i) {
      if (board[i][col] == value) {
        return true;
      }
    }
    return false;
  }

  bool checkSquare(int row, int col, int value) {
    if (row < 3 && col < 3) {
      for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 3; ++j) {
          if (board[i][j] == value) {
            return true;
          }
        }
      }
    } else if (row < 3 && col > 2 && col < 6) {
      for (int i = 0; i < 3; ++i) {
        for (int j = 3; j < 6; ++j) {
          if (board[i][j] == value) {
            return true;
          }
        }
      }
    } else if (row > 2 && row < 6 && col < 3) {
      for (int i = 3; i < 6; ++i) {
        for (int j = 0; j < 3; ++j) {
          if (board[i][j] == value) {
            return true;
          }
        }
      }
    } else if (row > 2 && row < 6 && col > 2 && col < 6) {
      for (int i = 3; i < 6; ++i) {
        for (int j = 3; j < 6; ++j) {
          if (board[i][j] == value) {
            return true;
          }
        }
      }
    }
    return false;
  }

  void setTest() {
    board = List.generate(9, (i) => List.generate(9, (j) => 0));
    notifyListeners();
    int r = Random().nextInt(5);
    switch (r) {
      case 1:
        board[0][0] = 2;
        board[0][4] = 8;
        board[0][5] = 7;
        board[0][8] = 5;
        board[1][0] = 5;
        board[1][1] = 1;
        board[1][4] = 9;
        board[1][6] = 7;
        board[1][7] = 6;
        board[2][1] = 3;
        board[2][2] = 7;
        board[2][6] = 9;
        board[2][7] = 2;
        board[3][0] = 6;
        board[3][1] = 4;
        board[3][3] = 8;
        board[3][4] = 2;
        board[3][7] = 5;
        board[4][1] = 2;
        board[4][4] = 5;
        board[4][8] = 6;
        board[5][0] = 3;
        board[5][2] = 5;
        board[5][4] = 6;
        board[5][5] = 9;
        board[5][6] = 2;
        board[5][7] = 8;
        board[5][8] = 4;
        board[6][0] = 1;
        board[6][3] = 9;
        board[6][6] = 6;
        board[6][7] = 7;
        board[7][5] = 5;
        board[7][7] = 3;
        board[8][1] = 8;
        board[8][2] = 2;
        board[8][5] = 1;
        board[8][8] = 9;
        notifyListeners();
        break;
      case 2:
        board[0][1] = 3;
        board[0][3] = 4;
        board[0][6] = 5;
        board[1][0] = 6;
        board[1][1] = 7;
        board[1][5] = 5;
        board[1][8] = 2;
        board[2][1] = 4;
        board[2][6] = 1;
        board[3][3] = 8;
        board[3][4] = 7;
        board[3][6] = 9;
        board[4][0] = 8;
        board[4][5] = 6;
        board[4][8] = 3;
        board[5][2] = 2;
        board[6][2] = 7;
        board[6][5] = 2;
        board[6][8] = 5;
        board[7][4] = 9;
        board[7][6] = 7;
        board[7][7] = 3;
        board[8][8] = 9;
        notifyListeners();
        break;
      case 3:
        board[0][7] = 1;
        board[0][8] = 8;
        board[1][1] = 5;
        board[1][2] = 7;
        board[1][6] = 4;
        board[2][3] = 1;
        board[3][3] = 3;
        board[3][7] = 6;
        board[3][8] = 2;
        board[4][0] = 7;
        board[4][5] = 9;
        board[4][6] = 1;
        board[4][8] = 5;
        board[5][4] = 6;
        board[5][7] = 7;
        board[6][2] = 2;
        board[6][7] = 3;
        board[7][0] = 8;
        board[7][2] = 1;
        board[7][5] = 7;
        board[8][2] = 9;
        board[8][3] = 6;
        board[8][7] = 2;
        notifyListeners();
        break;
      case 4:
        board[0][2] = 7;
        board[0][4] = 3;
        board[0][7] = 5;
        board[1][6] = 7;
        board[2][1] = 3;
        board[2][5] = 4;
        board[2][8] = 1;
        board[3][1] = 4;
        board[3][5] = 1;
        board[3][6] = 9;
        board[3][8] = 2;
        board[4][2] = 6;
        board[4][4] = 4;
        board[4][8] = 5;
        board[5][0] = 8;
        board[5][4] = 5;
        board[5][6] = 6;
        board[6][1] = 1;
        board[6][8] = 6;
        board[7][5] = 5;
        board[7][8] = 4;
        board[8][0] = 2;
        board[8][4] = 8;
        notifyListeners();
        break;
      case 5:
        board[0][2] = 4;
        board[0][7] = 5;
        board[0][8] = 7;
        board[1][6] = 3;
        board[1][7] = 9;
        board[2][3] = 1;
        board[2][5] = 6;
        board[3][0] = 1;
        board[3][2] = 5;
        board[3][3] = 9;
        board[4][0] = 9;
        board[4][1] = 4;
        board[4][3] = 2;
        board[4][8] = 1;
        board[5][5] = 3;
        board[6][0] = 2;
        board[6][1] = 6;
        board[6][5] = 8;
        board[7][1] = 8;
        board[7][6] = 7;
        board[8][3] = 5;
        board[8][7] = 2;
        notifyListeners();
        break;
    }
  }

  void solveBoard() async {
    List<int> lastR = new List<int>();
    List<int> lastC = new List<int>();
    List<int> val = new List<int>();
    lastR.add(0);
    lastC.add(0);
    val.add(1);

    while (true) {
      print("Got to first loop");
      while (board[lastR.last][lastC.last] != 0) {
        if (lastC.last != 8) {
          lastC.last += 1;
        } else {
          lastC.last = 0;
          lastR.last += 1;
        }
        if (lastR.last == 8 && lastC.last == 8) {
          return;
        }
      }
      print("Found Zero at ${lastR.last},${lastC.last}");

      while (checkRow(lastR.last, val.last) ||
          checkCol(lastC.last, val.last) ||
          checkSquare(lastR.last, lastC.last, val.last)) {
        if (val.last != 9) {
          val.last += 1;
        } else {
          while (val.last == 9) {
            if (val.length == 1) {
              throw Exception("Ran out of backtracking");
            }
            print("Backtrack");
            board[lastR.last][lastC.last] = 0;
            notifyListeners();
            val.removeLast();
            lastR.removeLast();
            lastC.removeLast();
          }
        }
      }

      board[lastR.last][lastC.last] = val.last;
      notifyListeners();
      val.add(1);
      lastR.add(lastR.last);
      lastC.add(lastC.last);
      await new Future.delayed(const Duration(microseconds: 200));
    }
  }
}
