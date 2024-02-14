import 'package:flutter/material.dart';
import 'package:quiz/quiz_app_page/front_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizAppPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
