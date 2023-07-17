import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'package:quiz/data/questions.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key , required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionScreen>{
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
     currentQuestionIndex ++; 
    });
  }

  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Text(
            currentQuestion.text , 
            style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30,), 
          ...currentQuestion.getShuffledAnswers().map((answer){
            return AnswerButton(
              answerText: answer, 
              onTap: (){
                answerQuestion(answer);
              },
              );
          })
        ],
        ),
      ),
    );
  }
}