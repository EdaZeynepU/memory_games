import 'package:flutter/material.dart';
class ExplanationPage extends StatefulWidget {
  const ExplanationPage({Key? key}) : super(key: key);

  @override
  State<ExplanationPage> createState() => _ExplanationPageState();
}

class _ExplanationPageState extends State<ExplanationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(child: Column(children: [Text(""),Text(""),],)),
    );
  }
}
