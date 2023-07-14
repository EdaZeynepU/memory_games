import 'package:flutter/material.dart';
import 'dart:math';

import 'package:memory_games/constants/main_colors.dart';

class Matchcolors extends StatefulWidget {
  const Matchcolors({Key? key}) : super(key: key);

  @override
  State<Matchcolors> createState() => _MatchcolorsState();
}

class _MatchcolorsState extends State<Matchcolors> {
  List<Color> colorsInit = [
    Color(0xFF0033FF),
    Color(0xFF0033FF),
    Color(0xFFFD2534),
    Color(0xFFFD2534),
    Color(0xFFFF0080),
    Color(0xFFFF0080),
    Color(0xFFCC13FF),
    Color(0xFFCC13FF),
    Color(0xFF5C1AFF),
    Color(0xFF5C1AFF),
    Color(0xFF5A18AB),
    Color(0xFF5A18AB),
    Color(0xFF00FFB2),
    Color(0xFF00FFB2),
    Color(0xFF26FD0F),
    Color(0xFF26FD0F),
    Color(0xFFFF8000),
    Color(0xFFFF8000),
    Color(0xFFFFD500),
    Color(0xFFFFD500),
    Color(0xFFD1FF03),
    Color(0xFFD1FF03),
    Color(0xFFFF9A9A),
    Color(0xFFFF9A9A),
    Color(0xFF480B0B),
    Color(0xFF480B0B),
    Color(0xFF104646),
    Color(0xFF104646),
    // Color(0xFF00CFFF),
    // Color(0xFF00CFFF),
    Color(0xFF140D6C),
    Color(0xFF140D6C),
  ];
  late int colorsLen = colorsInit.length;
  late List<List<Color>> colors = [];
  late List<Color> tempcolors;
  List<int> prev = [];
  Color? prevColor;
  int col = 5; //for further features and cleaner code
  int row = 6; //for further features and cleaner code
  List<int> isTappedList = [];

  @override
  void initState() {
    // TODO: implement initState

    colors = List.generate(
        row, (_) => List.generate(col, (_) => Colors.transparent));
    tempcolors = List.from(colorsInit);
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        colors[i][j] = randomColor();
      }
    }
    super.initState();
  }

  void restart() {
    setState(() {
      tempcolors = List.from(colorsInit);
      colorsLen = colorsInit.length;
      colors = List.generate(
          row, (_) => List.generate(col, (_) => Colors.transparent));
      for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
          colors[i][j] = randomColor();
        }
      }
      prevColor = null;
      prev = [];
      isTappedList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 650,
            width: 450,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "go back",
                          style: TextStyle(fontSize: 20),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          restart();
                        },
                        child: Text(
                          "Restart",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                for (int i = 0; i < row; i++)
                  Expanded(
                    flex: 1,
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      direction: Axis.horizontal,
                      children: placeBoxes(i),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> placeBoxes(num) {
    return [
      for (int i = 0; i < col; i++)
        GestureDetector(
          onTap: () {
            setState(() {
              if (isTappedList.isNotEmpty) {
                if (prevColor != Colors.transparent ||
                    colors[num][i] != Colors.transparent) {
                  if (isTappedList.length == 2) {
                    isTappedList = [num * 10 + i];
                    prevColor = colors[num][i];
                    prev = [num, i];
                  } else if (isTappedList.length == 1) {
                    if (prevColor == colors[num][i] && (prev[0]!=num || prev[1]!=i)) {
                      colors[prev[0]][prev[1]] = Colors.transparent;
                      colors[num][i] = Colors.transparent;
                    } else {
                      isTappedList.add(num * 10 + i);
                      prevColor = colors[num][i];
                      prev = [num, i];
                    }
                  } else {
                    isTappedList = [];
                  }
                }
              } else if (isTappedList.isEmpty) {
                isTappedList = [num * 10 + i];
                prevColor = colors[num][i];
                prev = [num, i];
              }
            });
          },
          child: Container(
            width: 60,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: colors[num][i] == Colors.transparent ||
                      isTappedList.contains(num * 10 + i)
                  ? colors[num][i]
                  : Colors.black,
            ),
            child: colors[num][i] == Colors.transparent
                ? Icon(Icons.done)
                : Text(""),
          ),
        ),
    ];
  }

  Color randomColor() {
    Color chosenColor = colorsLen > 0
        ? tempcolors.removeAt(Random().nextInt(colorsLen))
        : Colors.white;
    setState(() {
      colorsLen -= 1;
    });
    return chosenColor;
  }
}
