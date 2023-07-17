
import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/dbhelper/mongodb.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  await MongoDatabase.connect();
  runApp(
    const Quiz()
  );
}
