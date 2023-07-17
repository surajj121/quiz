import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question_summary.dart';


class ResultsScreen extends StatelessWidget {
   ResultsScreen({Key? key, required this.chosenAnswer}) : super(key: key);

  final List<String> chosenAnswer;
  final logger = Logger();

  

  Future<void> insertSummaryData(List<Map<String, Object>> summaryData) async {
    final db = Db("mongodb://sharmasuraj141111:121suraj121@cluster0.y5mesow.mongodb.net/");
    await db.open();
    final collection = db.collection('quiz'); // Replace with your collection name

    try {
  await collection.insertAll(summaryData);
  logger.d('Summary data inserted successfully!');
} catch (e) {
  logger.e('Error inserting summary data: $e');
} finally {
  await db.close();
}
  }

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    insertSummaryData(summaryData); // Insert summary data into MongoDB

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly.",
              style: const TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
  
  static Logger() {}
  
}