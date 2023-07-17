
import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question_summary.dart';


class ResultsSreen extends StatelessWidget {
  const ResultsSreen({super.key,required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer' : chosenAnswer[i],
      });
    }



    return summary;
  }

  @override
  Widget build(BuildContext context){
    
    final summaryData = getSummaryData(); 
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer']; 
    } ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
          Text("You answered $numCorrectQuestions out of $numTotalQuestions questions correctly.",style: TextStyle( fontSize: 24,color: Colors.white),textAlign: TextAlign.center,),
          const SizedBox(height: 30,),    
          QuestionSummary(summaryData),
          const SizedBox(height: 30,),
          ElevatedButton(
            onPressed: (){}, 
            child: const Text("restart")
            )  
        ]),
      ),
    );
  }
}