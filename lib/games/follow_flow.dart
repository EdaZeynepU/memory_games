import 'package:flutter/material.dart';
import 'dart:math';
import 'package:memory_games/constants/main_colors.dart';
import 'package:memory_games/screens/game_selection_page.dart';
import 'dart:async';

class FollowFlow extends StatefulWidget {
  const FollowFlow({Key? key}) : super(key: key);

  @override
  State<FollowFlow> createState() => _FollowFlowState();
}

class _FollowFlowState extends State<FollowFlow> {
  int row=5;
  int col=4;
  List<int> chosenFlow=[];
  List<int> userGuess=[];
  int tracker=1;
  int level=1;
  late int current;
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    restartHelper();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  void restartHelper(){
    for(int i=0;i<level;i++){
      chosenFlow.add(Random().nextInt(row*col));
    }

    current=chosenFlow[0];
    Timer(const Duration(milliseconds: 1200),() {
      setState(() {
        current=-1;
      });
    });

    timer = Timer.periodic(const Duration(milliseconds: 1300), (Timer t) {
      if (tracker!=chosenFlow.length) {
        setState(() {
          current=chosenFlow[tracker];
        });
        tracker++;
        Timer(const Duration(milliseconds: 1000),() {
          setState(() {
            current=-1;
          });
        },);
      }
      else {
        current=-1;
        timer.cancel();
      }

    });

  }

  void restart() {
    setState(() {
      chosenFlow.clear();
      userGuess.clear();
      tracker=1;
      restartHelper();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameSelectionPage(),));
                      },
                      child: const Text(
                        "go back",
                        style: TextStyle(fontSize: 20),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        level=1;
                        if(timer.isActive){
                          timer.cancel();
                        }
                        restart();
                      },
                      child: const Text(
                        "Restart",
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 520,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  for(int j=0;j<row;j++)
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for(int i=0;i<col;i++)
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              current=j*4+i;
                            });
                            Timer( Duration(milliseconds: 1000),() {
                              setState(() {
                                current=-1;
                              });
                            });
                            if(userGuess.length<chosenFlow.length){
                              userGuess.add(j*4+i);
                              if(userGuess.length==chosenFlow.length){
                                if(areEqual(userGuess,chosenFlow)){
                                  setState(() {
                                    level+=1;
                                  });
                                  final snackBar = SnackBar(
                                    backgroundColor: MainColor.successColor,
                                    duration: const Duration(milliseconds: 1000),
                                    content: const Text('Correct',style: TextStyle(fontSize: 40, color:Colors.white70),textAlign: TextAlign.center),
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  Timer(const Duration(milliseconds: 1600),(){
                                    restart();
                                  });
                                }else{
                                  _showAlertDialog();
                                }
                              }
                            }
                          },
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                                color: current==(j*4+i) ? MainColor.secondaryColor: Colors.blue.shade100,
                            ),
                            width: 90,
                            height: 90,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,

                          ),
                        ),

                    ],

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  bool areEqual(List<int> list1,List<int> list2){
    bool areListsEqual2=true;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        areListsEqual2= false;
        break;
      }
    }
    return areListsEqual2;
  }
  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('level: ${level}'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("You lost. Wanna play again?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('try again'),
              onPressed: () {
                level=1;
                restart();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('go back to games'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const GameSelectionPage(),));
              },
            ),
          ],
        );
      },
    );
  }
}
