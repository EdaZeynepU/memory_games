import 'package:flutter/material.dart';
import 'package:memory_games/games/word_pairs.dart';
import 'package:memory_games/screens/explanation_page.dart';
import '../constants/main_colors.dart';
import '../games/match_colors.dart';
import '../games/match_cards.dart';
import '../games/remember_number.dart';
import '../screens/home_page.dart';
import '../games/follow_flow.dart';

class GameSelectionPage extends StatefulWidget {
  const GameSelectionPage({Key? key}) : super(key: key);

  @override
  State<GameSelectionPage> createState() => _GameSelectionPageState();
}

class _GameSelectionPageState extends State<GameSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Text("Play Time",style: TextStyle(color: Colors.white,fontSize: 35),),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 200,
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GameOptionCard(
                            gameName: "match the colors",
                            img: "images/match_colors.jpg",
                            gamePage: (BuildContext context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ExplanationPage(title: "match the colors", explanation: "In this game, you have to match the same colors with each other. In Order to do that you should tap the boxes, (you can see max 2 boxes' color at a time) and see if they match.",gamePage: (BuildContext context) {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Matchcolors(),
                              ));
                              },),
                              ));
                            }),
                        GameOptionCard(
                          gameName: "match the photos",
                          img: "images/match_photos.jpg",
                          gamePage: (BuildContext context) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ExplanationPage(title: "match the cards", explanation: "In this game, you have to match the same photos with each other. In Order to do that you should tap the cards, (you can see max 2 cards' photos at a time) and see if they match.",gamePage: (BuildContext context) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Matchcards(),
                                ));
                              },),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GameOptionCard(
                            gameName: "Remember the Number",
                            img: "images/remember_number.jpg",
                            gamePage: (BuildContext context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ExplanationPage(title: "remember the number", explanation: "A random number will be shown to you digit to digit, after all the digits are shown you should enter the number. After submitting if it's true you will level up. (this means it will get 1 digit longer)",gamePage: (BuildContext context) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RememberNumber(),
                                  ));
                                },),
                              ));
                            }),
                        GameOptionCard(
                          gameName: "Words Pairs",
                          img: "images/word_pairs.jpg",
                          gamePage: (BuildContext context) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ExplanationPage(title: "words pair", explanation: "Random word or words will be chosen according to the level of your then shuffled with the same amount of word or words, after the chosen words are shown you should choose the chosen ones among these shuffled words. If you level up chosen words increase 1 more word.",gamePage: (BuildContext context) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => WordPairs(),
                                ));
                              },),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GameOptionCard(
                            gameName: "Follow the Flow",
                            img: "images/follow_flow.jpg",
                            gamePage: (BuildContext context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ExplanationPage(title: "follow the flow", explanation: "In this game first, you will see a sequence of boxes changing color in order and you have to remember the sequence, then when it completes its tour you should tap the same boxes in the same order.. If you choose the sequence right you will level up (this means it will get 1 digit longer)",gamePage: (BuildContext context) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FollowFlow()
                                  ));
                                },),
                              ));
                            }),
                        GameOptionCard(
                          gameName: "back to home",
                          img: "images/back.jpg",
                          gamePage: (BuildContext context) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef GamePageBuilder = void Function(BuildContext context);

class GameOptionCard extends StatefulWidget {
  final String gameName;
  final String img;
  final GamePageBuilder gamePage;

  const GameOptionCard(
      {Key? key,
      required this.gameName,
      required this.img,
      required this.gamePage})
      : super(key: key);

  @override
  State<GameOptionCard> createState() => _GameOptioncolorstate();
}

class _GameOptioncolorstate extends State<GameOptionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          widget.gamePage(context);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              width: 180,
              child: Image.asset(widget.img, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Text(widget.gameName),
            ),
          ],
        ),
      ),
    );
  }
}
