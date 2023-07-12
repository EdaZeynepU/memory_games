import 'package:flutter/material.dart';
import '../constants/main_colors.dart';

class Why extends StatelessWidget {
  const Why({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 4100,
            width: 360,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                    fixedSize: Size(350, 20),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("back",style: TextStyle(fontSize: 20)),),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.deepPurple,
                    ),
                    child: Text("Playing memory games that involve matching colors can have several benefits for cognitive development and mental well-being. Here are a few reasons why engaging in such games can be beneficial:",style: TextStyle(fontSize: 30,color: Colors.white,))
                ),
                Text("1.Memory Enhancement: Matching colors requires you to remember the location of different colors and recall them when needed. This exercise challenges your memory and can help improve your ability to retain and retrieve information. Regular practice can enhance your working memory, which is essential for various cognitive tasks.",style: TextStyle(fontSize: 25)),
                Text("2.Attention and Focus: Matching colors demands concentration and focus. By engaging in these memory games, you train your brain to stay attentive and avoid distractions. This ability to sustain focus can carry over to other areas of life, such as work, studying, and problem-solving.",style: TextStyle(fontSize: 25)),
                Text("3.Pattern Recognition: Matching colors often involves identifying and recognizing patterns. As you play these games, you sharpen your pattern recognition skills, which can be useful in various real-life situations. Pattern recognition allows you to make connections, solve problems efficiently, and perceive information more accurately.",style: TextStyle(fontSize: 25)),
                Text("4.Cognitive Flexibility: Memory games that involve matching colors require you to switch between different colors and locations quickly. This flexibility in thinking and shifting attention can enhance cognitive flexibility, a crucial skill for adapting to new situations, multitasking, and problem-solving.",style: TextStyle(fontSize: 25)),
                Text("5.Stress Relief and Relaxation: Engaging in memory games can provide a break from daily stressors. These games can be enjoyable and relaxing, allowing you to unwind and redirect your focus away from worries and anxieties. Playing memory games can be a form of mindfulness, promoting relaxation and mental well-being.",style: TextStyle(fontSize: 25)),
                Text("6.Neuroplasticity and Brain Health: Regularly challenging your memory through color-matching games can support brain health and promote neuroplasticity. Neuroplasticity refers to the brain's ability to reorganize and form new neural connections. By stimulating your brain with memory games, you can enhance neural pathways, improve cognitive function, and potentially reduce the risk of cognitive decline.",style: TextStyle(fontSize: 25)),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepPurple,
            ),
            child: Text("In conclusion, playing memory games that involve matching colors can have various benefits, including memory enhancement, improved attention and focus, pattern recognition, cognitive flexibility, stress relief, and brain health promotion. So, consider incorporating these games into your routine to enjoy the cognitive and mental well-being advantages they offer.",style: TextStyle(fontSize: 30,color: Colors.white)),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}



