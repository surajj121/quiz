import 'dart:math';

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{

  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;

  @override
  Widget build(context){
    return  Center(
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Image.asset('assets/images/logo.png',
        width: 250,
        ),
        const SizedBox(height: 120,),
        const Text("Take a short fun quiz!", 
        style: TextStyle(
          color: Color.fromARGB(255, 200, 197, 205),
          fontSize: 22,
        ),
        ),
        const SizedBox(height: 20,),
        OutlinedButton(
          onPressed:  startQuiz, 
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
             
          ),
          
          child: const Text("Start quiz"))
      ],)
      );
  }
}