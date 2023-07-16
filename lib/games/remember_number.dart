import 'package:flutter/material.dart';
import 'dart:math';
import 'package:memory_games/constants/main_colors.dart';
import 'dart:async';

import '../screens/game_selection_page.dart';

class RememberNumber extends StatefulWidget {
  const RememberNumber({Key? key}) : super(key: key);

  @override
  State<RememberNumber> createState() => _RememberNumberState();
}

class _RememberNumberState extends State<RememberNumber> {
  late int num;
  late int numPart;
  late int level;
  int userGuess = -1;
  late Timer timer;
  List<int> numList = [];
  bool showInput = false;
  bool bgIndicator = true;

  @override
  void initState() {
    num = 0;
    level = 1;
    int temp;
    for (int i = 0; i < level; i++) {
      temp = Random().nextInt(10);
      num += (pow(10, level - i - 1).toInt()) * (temp);
      print(num);
      print(level - 1 - i);
      numList.add(temp);
    }

    numPart = numList.removeAt(0);
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (numList.isNotEmpty) {
          numPart = numList.removeAt(0);
            bgIndicator= !bgIndicator;
        } else {
          showInput = true;
          timer.cancel();
        }
      });
    });
    super.initState();
  }

  void restart() {
    // timer.cancel();
    setState(() {
      List<int> numList = [];
      showInput = false;
      num = 0;
      int temp;
      for (int i = 0; i < level; i++) {
        temp = Random().nextInt(10);
        num += (pow(10, level - i - 1).toInt()) * (temp);
        numList.add(temp);
      }
      if(numList[0]==0){
        numList[0]=1;
        num += (pow(10, level - 1).toInt());
      }
      numPart = numList.removeAt(0);

      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        setState(() {
          if (numList.isNotEmpty) {
            numPart = numList.removeAt(0);
            bgIndicator= !bgIndicator;
          } else {
            showInput = true;
            timer.cancel();
          }
        });
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                      setState(() {
                        level=1;
                      });
                      restart();
                      showInput=false;
                    },
                    child: Text(
                      "Restart",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
            if (showInput) ...[
              Container(
                width: 200,
                padding: EdgeInsets.only(top: 20,bottom: 20),
                color: Colors.white54,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    try{
                      setState(() {
                        userGuess = int.tryParse(value)!;
                      });
                    } catch (err){
                      userGuess = -1;
                    }
                    print(userGuess);
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (userGuess == num) {
                      setState(() {
                        level += 1;
                      });
                      restart();
                    } else {
                      _showAlertDialog();
                    }
                  },
                  child: Text("-Done-")),
            ] else ...[
              Container(
                color: bgIndicator? Colors.blue[900]:MainColor.primaryColor,
                padding: EdgeInsets.only(left: 30,right: 30,bottom: 10,top: 10),
                child: Text(
                  "${numPart}",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('level: ${level}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('the number was ${num.toString()}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('try again'),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                  level=1;
                  restart();
                  showInput=false;
                });
              },
            ),
            TextButton(
              child: const Text('go back to games'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameSelectionPage(),));
              },
            ),
          ],
        );
      },
    );
  }
}
