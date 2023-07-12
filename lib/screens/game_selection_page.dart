import 'package:flutter/material.dart';
import 'package:memory_games/games/word_pairs.dart';
import '../constants/main_colors.dart';
import '../games/match_colors.dart';
import '../games/match_cards.dart';
import '../games/remember_number.dart';
import '../screens/home_page.dart';

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
                                builder: (context) => Matchcolors(),
                              ));
                            }),
                        GameOptionCard(
                          gameName: "match the photos",
                          img: "images/match_photos.jpg",
                          gamePage: (BuildContext context) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Matchcards(),
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
                                builder: (context) => RememberNumber(),//for now
                              ));
                            }),
                        GameOptionCard(
                          gameName: "Words Pairs",
                          img: "images/word_pairs.jpg",
                          gamePage: (BuildContext context) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WordPairs(),//for now
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
                            gameName: "oyun3",
                            img: "images/img.jpg",
                            gamePage: (BuildContext context) {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => HomePage(),//for now
                              // ));
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
