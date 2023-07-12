import 'package:flutter/material.dart';
import '../constants/main_colors.dart';

class tipsForMemory extends StatelessWidget {
  const tipsForMemory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.secondaryColor,
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
                      color: Colors.blue[900],
                    ),
                    child: Text("Ten tips to help improve your memory",style: TextStyle(fontSize: 30,color: Colors.white,))
                ),
                Text("1. Get Enough Sleep: A good night's sleep is essential for memory consolidation. Aim for 7-8 hours of quality sleep each night to allow your brain to process and store information effectively.",style: TextStyle(fontSize: 25)),
                Text("2. Stay Active and Exercise: Regular physical exercise has been linked to improved memory and cognitive function. Engaging in activities that get your heart rate up can enhance blood flow to the brain, promoting better memory retention.",style: TextStyle(fontSize: 25)),
                Text("3. Manage Stress: High levels of stress can impair memory and cognitive function. Practice stress management techniques such as deep breathing, meditation, or engaging in activities you enjoy to reduce stress and support optimal memory performance.",style: TextStyle(fontSize: 25)),
                Text("4. Stay Mentally Active: Keep your brain engaged by challenging it with mentally stimulating activities. Read books, solve puzzles, play strategy games, or learn new skills to exercise your memory and keep it sharp.",style: TextStyle(fontSize: 25)),
                Text("5. Use Mnemonic Devices: Mnemonic techniques can aid memory retention. Use acronyms, visual imagery, or create associations to help remember information. For example, to remember a grocery list, visualize the items in a familiar location or create a story connecting the items.",style: TextStyle(fontSize: 25)),
                Text("6. Break Information into Chunks: When trying to remember a large amount of information, break it down into smaller, manageable chunks. This technique, known as chunking, makes it easier for your brain to process and retain the information.",style: TextStyle(fontSize: 25)),
                Text("7. Practice Retrieval: Actively retrieving information from memory strengthens memory recall. Test yourself by trying to recall information without looking at notes or resources. This practice enhances your ability to remember information when you need it.",style: TextStyle(fontSize: 25)),
                Text("8. Create a Memory Palace: The method of loci, also known as the memory palace technique, involves associating items to be remembered with specific locations in a familiar environment. Mentally walking through this space can help you recall the information more easily.",style: TextStyle(fontSize: 25)),
                Text("9. Maintain a Healthy Diet: Certain nutrients, such as omega-3 fatty acids, antioxidants, and vitamins, are beneficial for brain health and memory. Include foods like fatty fish, berries, leafy greens, nuts, and seeds in your diet to support optimal brain function.",style: TextStyle(fontSize: 25)),
                Text("10. Stay Organized: A cluttered environment can be distracting and make it difficult to remember things. Keep your physical and digital spaces organized to reduce cognitive load and improve memory recall.",style: TextStyle(fontSize: 25)),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue[900],
                  ),
                  child: Text("Remember, improving memory is a gradual process, so be patient and consistent with these tips. By incorporating these practices into your daily routine, you can enhance your memory and cognitive abilities over time.",style: TextStyle(fontSize: 30,color: Colors.white)),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}



