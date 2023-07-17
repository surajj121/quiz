import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionSummary extends StatelessWidget {

  final List<Map<String, Object>> summaryData;
  const QuestionSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context){

    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(children: summaryData.map((data){
          return Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
              Text(((data['question_index'] as int) +1).toString(),),
            
              Expanded(
                
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                    
                    
                    Text(data['question'] as String ,style: const TextStyle(fontWeight: FontWeight.bold , color: Color.fromARGB(255, 221, 210, 210)),),
                    //const SizedBox(height: 5,),
                    Text(data['user_answer'] as String,style: const TextStyle(fontWeight: FontWeight.normal)),
                    Text(data['correct_answer'] as String,style: const TextStyle(color: Color.fromARGB(255, 221, 210, 210) )),
                    const SizedBox(height: 22,),
                  ],),
                ),
              ),
              ],),
          );
        },
        ).toList(),
        ),
      ),
    );

  }
}