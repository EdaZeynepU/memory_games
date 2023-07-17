import 'package:flutter/material.dart';
import 'dart:math';
import '../constants/main_colors.dart';
import 'dart:async';

import '../screens/game_selection_page.dart';


class WordPairs extends StatefulWidget {
  const WordPairs({Key? key}) : super(key: key);

  @override
  State<WordPairs> createState() => _WordPairsState();
}

class _WordPairsState extends State<WordPairs> {
  List<String> lst = [
    "Apple",
    "Banana",
    "Carrot",
    "Dog",
    "Elephant",
    "Frog",
    "Giraffe",
    "Horse",
    "Ice cream",
    "Jellyfish",
    "Kangaroo",
    "Lemon",
    "Mango",
    "Noodle",
    "Orange",
    "Penguin",
    "Quail",
    "Raspberry",
    "Strawberry",
    "Tomato",
    "Umbrella",
    "Violin",
    "Watermelon",
    "Xylophone",
    "Yogurt",
    "Zebra",
    "Ant",
    "Bear",
    "Cat",
    "Dolphin",
    "Elephant",
    "Flamingo",
    "Gorilla",
    "Hippo",
    "Iguana",
    "Jaguar",
    "Koala",
    "Lion",
    "Monkey",
    "Nightingale",
    "Octopus",
    "Panda",
    "Quokka",
    "Rabbit",
    "Snake",
    "Tiger",
    "Unicorn",
    "Vulture",
    "Whale",
    "X-ray fish",
    "Yak",
    "Zucchini"
  ];
  late Timer timer;
  List<String> chosenWords=[];
  List<String> options=[];
  String currentWord="";
  int totalChosen=1;
  int tracker=1;
  bool showInput=false;
  List<String> userGuess=[];
  // List<String> String


  @override
  void initState() {
    super.initState();
    restartHelper();
  }

  void restartHelper(){
    int range=lst.length;
    int temp;
    for (int i = 0; i < totalChosen; i++) {
      temp = Random().nextInt(range);
      chosenWords.add(lst[temp]);
      options.add(lst.removeAt(temp));
      range--;
      temp = Random().nextInt(range);
      range--;
      options.add(lst.removeAt(temp));
    }

    options.sort();
    currentWord=chosenWords[0];

    timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      setState(() {
        if (chosenWords.last!=chosenWords[tracker-1]) {
          setState(() {
            currentWord=chosenWords[tracker];
            tracker++;
          });
          print("time koşul1");
          print(currentWord);
        } else {
          showInput=true;
          print("time koşul2");
          timer.cancel();
        }
      });
    });
  }

  void restart(){
    setState(() {
      lst.addAll(chosenWords);
      tracker = 1;
      showInput = false;
      userGuess.clear();
      chosenWords.clear();
      options.clear();
      currentWord = "";
      restartHelper();
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameSelectionPage(),));
                    },
                    child: Text(
                      "go back",
                      style: TextStyle(fontSize: 20),
                    )),
                ElevatedButton(
                    onPressed: () {
                      if (timer.isActive){
                        timer.cancel();
                      }
                      totalChosen=1;
                      showInput=false;
                      restart();
                    },
                    child: Text(
                      "Restart",
                      style: TextStyle(fontSize: 20),
                    )),
              ],),
            showInput ?
            Column(

              crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  for(int i=0;i<totalChosen*2;i+=2)
                    ...[Flex(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        direction: Axis.horizontal,
                      children: [Container(
                        color: Colors.white60,
                        width: 200,
                        child: CheckboxListTile(
                          title: Text(options[i],textAlign: TextAlign.center),
                          value: userGuess.contains(options[i]),

                          onChanged: (value) => handleAnswerSelected(options[i]),
                        ),
                      ),Container(
                        color: Colors.white60,
                        width: 200,
                        child: CheckboxListTile(
                          title: Text(options[i+1],textAlign: TextAlign.center),
                          value: userGuess.contains(options[i+1]),

                          onChanged: (value) => handleAnswerSelected(options[i+1]),
                        ),
                      ),]
                    ),SizedBox(height: 5,)],

                  ElevatedButton(
                    onPressed: () {
                      bool indicator=false;
                      if(chosenWords.length==userGuess.length){
                        indicator= true;
                        for(int i=0;i<totalChosen;i++){
                          if(!chosenWords.contains(userGuess[i])) {
                            indicator= false;
                            break;
                          }
                        }
                      }

                      if(indicator){
                          setState(() {
                            totalChosen += 1;
                            restart();
                          });
                          // restart();
                        } else {
                          _showAlertDialog();
                        }
                    },
                    child: Text('Submit'),
                  ),
                ]
            )
            :Text(
              "${currentWord}",
              style: TextStyle(color: Colors.white, fontSize: 50),
            )
        ]
        ),
      ),
    );
  }

  void handleAnswerSelected(String answer) {
    setState(() {
      if (userGuess.contains(answer)) {
        userGuess.remove(answer);
      } else {
        userGuess.add(answer);
      }
      print(userGuess);
      print(chosenWords);
    });
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('level: ${totalChosen}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('the words were ${chosenWords.join(',')}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('restart'),
              onPressed: () {
                Navigator.of(context).pop();
                totalChosen=1;
                showInput=false;
                restart();
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