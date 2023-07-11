import 'package:flutter/material.dart';
import '../constants/main_colors.dart';
import '../games/match_colors.dart';
import '../games/match_cards.dart';
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
      // backgroundColor: colors.deepPurpleAccent,
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
                            gameName: "oyun1",
                            img: "images/img.jpg",
                            gamePage: (BuildContext context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage(),//for now
                              ));
                            }),
                        GameOptionCard(
                          gameName: "oyun2",
                          img: "images/img.jpg",
                          gamePage: (BuildContext context) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage(),//for now
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
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage(),//for now
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
