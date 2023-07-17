import 'package:flutter/material.dart';
import '../constants/main_colors.dart';
typedef GamePageBuilder = void Function(BuildContext context);

class ExplanationPage extends StatefulWidget {
  final String title;
  final String explanation;
  final GamePageBuilder gamePage;
  const ExplanationPage({Key? key, required this.title, required this.explanation, required this.gamePage}) : super(key: key,);

  @override
  State<ExplanationPage> createState() => _ExplanationPageState();
}

class _ExplanationPageState extends State<ExplanationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.expColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(child: Column(children: [
            const SizedBox(height: 70,),
            Text(widget.title,style: TextStyle(fontSize: 40,)),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(widget.explanation,style: TextStyle(fontSize: 25,)),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 50),
                ),
                onPressed: (){
              widget.gamePage(context);
            }, child: Text("-start-",style: TextStyle(fontSize: 25),))
          ],)),
        ),
      ),
    );
  }
}
