import 'package:flutter/material.dart';
import 'dart:math';

import 'package:memory_games/constants/main_colors.dart';
import 'package:memory_games/screens/game_selection_page.dart';

class Matchcards extends StatefulWidget {
  const Matchcards({Key? key}) : super(key: key);

  @override
  State<Matchcards> createState() => _MatchcardsState();
}

class _MatchcardsState extends State<Matchcards> {
  List<AssetImage> cardsInit = [
    AssetImage("images/icecream.jpg"),
    AssetImage("images/palm.jpg"),
    AssetImage("images/picnic.jpg"),
    AssetImage("images/surf.jpg"),
    AssetImage("images/summerstuf.jpg"),
    AssetImage("images/watermelon.jpg"),
  ];
  late int cardsLen;
  late List<List<AssetImage>> cards = [];
  late List<AssetImage> tempcards;
  List<int> prev = [];
  AssetImage? prevcard;
  int col = 3; //for further features and cleaner code
  int row = 4; //for further features and cleaner code
  List<int> isTappedList = [];

  @override
  void initState() {
    cards = List.generate(
        row, (_) => List.generate(col, (_) => AssetImage("images/card_bg.jpg")));
    tempcards = List.from(cardsInit);
    tempcards.addAll(cardsInit);
    cardsLen = tempcards.length;
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        cards[i][j] = randomcard();
      }
    }
    super.initState();
  }

  void restart() {
    setState(() {
      cards = List.generate(
          row, (_) => List.generate(col, (_) => AssetImage("images/card_bg.jpg")));
      tempcards = List.from(cardsInit);
      tempcards.addAll(cardsInit);
      cardsLen = tempcards.length;
      for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
          cards[i][j] = randomcard();
        }
      }
      isTappedList = [];
      prevcard = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 880,
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameSelectionPage(),));
                      },
                      child: Text("go back", style: TextStyle(fontSize: 20)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        restart();
                      },
                      child: Text("Restart", style: TextStyle(fontSize: 20)),
                    ),
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
                if (prevcard != AssetImage("images/correct.jpg") ||
                    cards[num][i] != AssetImage("images/correct.jpg")) {
                  if (isTappedList.length == 2) {
                    isTappedList = [num * 10 + i];
                    prevcard = cards[num][i];
                    prev = [num, i];
                  } else if (isTappedList.length == 1) {
                    if (prevcard == cards[num][i] && (prev[0]!=num || prev[1]!=i)) {
                      cards[prev[0]][prev[1]] =
                          AssetImage("images/correct.jpg");
                      cards[num][i] = AssetImage("images/correct.jpg");
                      isTappedList = [];
                      prev = [];
                    } else {
                      isTappedList.add(num * 10 + i);
                      prevcard = cards[num][i];
                      prev = [num, i];
                    }
                  } else {
                    isTappedList = [];
                  }
                }
              } else if (isTappedList.isEmpty) {
                isTappedList = [num * 10 + i];
                prevcard = cards[num][i];
                prev = [num, i];
              }
            });
          },
          child: Container(
            width: 120,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: cards[num][i] == AssetImage("images/correct.jpg")
                    ? AssetImage("images/correct.jpg")
                    : isTappedList.contains(num * 10 + i)
                        ? cards[num][i]
                        : AssetImage("images/card_bg.jpg"), //
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
    ];
  }

  AssetImage randomcard() {
    late AssetImage img;
    if (cardsLen > 0) {
      img = tempcards.removeAt(Random().nextInt(cardsLen));
    } else {
      img = AssetImage("images/icecream.jpg");
    }
    setState(() {
      cardsLen -= 1;
    });
    return img;
  }
}
