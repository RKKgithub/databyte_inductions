import 'package:flutter/material.dart';
import 'package:iris_task/choice_screen.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChoiceScreen(),
      theme: ThemeData.dark(),
    );
  }
}
