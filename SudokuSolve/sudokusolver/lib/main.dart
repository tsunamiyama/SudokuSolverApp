import 'package:flutter/material.dart';
import 'sudokuBoard.dart';
import 'package:provider/provider.dart';
import 'sudokuBoardNotifier.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => (SudokuBoardNotifier()),
    child: BoardPage(),
  ));
}

class BoardPage extends StatefulWidget {
  const BoardPage({Key key}) : super(key: key);

  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  List<Widget> _getNumButtons() {
    List<Widget> tempList = List.generate(9, (index) {
      return Expanded(
          child: OutlineButton(
        child: Text(
          "${index + 1}",
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          if (Provider.of<SudokuBoardNotifier>(context, listen: false)
                  .selectedCell
                  .getRow() ==
              -1) {
            return false;
          }
          Provider.of<SudokuBoardNotifier>(context, listen: false)
              .changeValue(index + 1);
        },
        highlightedBorderColor: Colors.transparent,
      ));
    });
    tempList.add(Expanded(
      child: OutlineButton(
        child: Text("X", style: TextStyle(color: Colors.black)),
        onPressed: () {
          if (Provider.of<SudokuBoardNotifier>(context, listen: false)
                  .selectedCell
                  .getRow() ==
              -1) {
            return false;
          }
          Provider.of<SudokuBoardNotifier>(context, listen: false)
              .changeValue(0);
        },
        highlightedBorderColor: Colors.transparent,
      ),
    ));
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sudoku Solver",
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SudokuBoard(),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: _getNumButtons(),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    child: OutlineButton(
                      child: Text("Clear Board"),
                      highlightedBorderColor: Colors.transparent,
                      onPressed: () {
                        Provider.of<SudokuBoardNotifier>(context, listen: false)
                            .clearBoard();
                      },
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    child: OutlineButton(
                      child: Text("Solve Board"),
                      highlightedBorderColor: Colors.transparent,
                      onPressed: () {
                        print("Solve Pressed");
                        Provider.of<SudokuBoardNotifier>(context, listen: false)
                            .solveBoard();
                      },
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    child: OutlineButton(
                      child: Text("Get Test Board"),
                      highlightedBorderColor: Colors.transparent,
                      onPressed: () {
                        Provider.of<SudokuBoardNotifier>(context, listen: false)
                            .setTest();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
