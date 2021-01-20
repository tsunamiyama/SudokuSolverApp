import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sudokuBoardNotifier.dart';

class SudokuBoard extends StatefulWidget {
  const SudokuBoard({Key key}) : super(key: key);

  @override
  _SudokuBoardState createState() => _SudokuBoardState();
}

class _SudokuBoardState extends State<SudokuBoard> {
  List<TableRow> _boardRows() {
    return List.generate(9, (int rowNum) {
      return TableRow(children: _getRow(rowNum));
    });
  }

  List<Widget> _getRow(int rowNum) {
    return List.generate(9, (int colNum) {
      SudokuCell cell = SudokuCell(rowNum, colNum);
      return cell;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.black87,
      ),
      children: _boardRows(),
      defaultColumnWidth: FixedColumnWidth(40.0),
    );
  }
}

class SudokuCell extends StatelessWidget {
  final int row, col;
  SudokuCell(this.row, this.col);

  BoxDecoration boardAccents(int r, int c) {
    Border b;
    switch (c) {
      case 0:
        if (r == 0) {
          b = Border(
            top: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            left: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 8) {
          b = Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            left: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 2 || r == 5) {
          b = Border(
            left: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else {
          b = Border(
            left: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        }
        break;
      case 2:
        if (r == 0) {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            top: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 8) {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 2) {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 5) {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        }
        break;
      case 5:
        if (r == 0) {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            top: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 8) {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 2) {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 5) {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        }
        break;
      case 8:
        if (r == 0) {
          b = Border(
            top: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 8) {
          b = Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 2 || r == 5) {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else {
          b = Border(
            right: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        }
        break;
      default:
        if (r == 0) {
          b = Border(
            top: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 2 || r == 5) {
          b = Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        } else if (r == 8) {
          b = Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          );
        }
    }
    BoxDecoration accent = BoxDecoration(border: b);
    return accent;
  }

  int getRow() {
    return row;
  }

  int getCol() {
    return col;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boardAccents(row, col),
      width: 40,
      height: 40,
      child: Consumer<SudokuBoardNotifier>(
        builder: (context, sudokuBoardNotifier, child) {
          return InkWell(
            child: Center(
              child: Text(
                "${sudokuBoardNotifier.getCellValue(row, col)}",
                style: TextStyle(fontSize: 25),
              ),
            ),
            onTap: () {
              sudokuBoardNotifier.selectedCell = this;
            },
          );
        },
      ),
    );
  }
}
