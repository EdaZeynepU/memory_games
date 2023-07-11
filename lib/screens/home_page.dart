import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/main_colors.dart';
import 'game_selection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // static var customFontWhite = GoogleFonts.coiny(
  //     textStyle: TextStyle(
  //       color: colors.white,
  //       letterSpacing: 3,
  //       fontSize: 25,
  //     ),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.accentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20,),
            Container(
              child: Text("Mind Gamesss",style: TextStyle(fontSize: 45,color: MainColor.primaryColor,fontWeight: FontWeight.w700)),
            ),
            Center(
              child: Container(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                          builder: (context) {
                            return GameSelectionPage();
                          }
                        ));
                    } ,
                            child: Text("Games",), style: buttonStyle(),),
                    ElevatedButton(onPressed: (){} , child: Text("Tips for Memory"), style: buttonStyle(),),
                    ElevatedButton(onPressed: (){} , child: Text("Why These Games"), style: buttonStyle(),),
                    ElevatedButton(onPressed: (){} , child: Text("..."), style: buttonStyle(),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
            backgroundColor: MainColor.primaryColor, // Background color
            fixedSize: Size(250, 60),
            foregroundColor: Colors.white, // Text color
            textStyle: TextStyle(fontSize: 23),
            elevation: 8, // Elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Border radius
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Padding
          );
  }
}
