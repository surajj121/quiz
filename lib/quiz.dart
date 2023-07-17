import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/results_screen.dart';
import 'package:quiz/start_screen.dart'; 

 
class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override 
  State<Quiz> createState(){
    return _QuizState();
  } 
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];
  Widget? activeScreen ;

  @override
  void initState(){
    activeScreen = StartScreen(switchScreen); 
    super.initState();
  }
  
  void switchScreen(){
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnsers,);
    });
  }

  void chooseAnsers(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        
        activeScreen = ResultsScreen(chosenAnswer: selectedAnswers);
      });
    }
  }

  void restartQuiz(){
    setState(() {
      activeScreen = StartScreen(switchScreen);  
    });
  }

 

  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
              Colors.lightBlue,
              Color.fromARGB(255, 72, 55, 187),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}