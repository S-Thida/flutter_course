import 'package:flutter/material.dart';
import 'package:flutter_2/W7-S2-Flutter%20Quiz/lib/model/quiz.dart';
import 'package:flutter_2/W7-S2-Flutter%20Quiz/lib/widgets/app_button.dart';
 
class QuestionScreen extends StatelessWidget {
   Question questions;
   ValueChanged<String> getValue;
   QuestionScreen({super.key, required this.questions, required this.getValue});
  
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        Text(questions.title, style: const TextStyle(color: Colors.white),),
        const SizedBox(height: 30.0,),
        for(var answer in questions.possibleAnswers)
        AppButton(answer, onTap:()=> getValue(answer) ,
        )
        
      ],
    );
  }
}
 