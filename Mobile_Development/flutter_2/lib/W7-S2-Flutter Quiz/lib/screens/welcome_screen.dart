import 'package:flutter/material.dart';
import 'package:flutter_2/W7-S2-Flutter%20Quiz/lib/widgets/app_button.dart';

 class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onpressed});
   final VoidCallback onpressed;
   
  
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('assets/W7-S2/quiz-logo.png', height: 300,width: 300,),
      const SizedBox(height: 20.0,),
      const Text('Crazy Quiz', style: TextStyle(color: Colors.white, fontSize: 30.0),),
      const SizedBox(height: 20.0,),
      AppButton(
        icon:Icons.arrow_forward,
        onTap: onpressed, 'Start Quiz')]);
  }
}
 