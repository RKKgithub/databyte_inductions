import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({this.predictionData});

  final predictionData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Results'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Type:',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      predictionData['name'].toString(),
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Accuracy:',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      predictionData['p'].toString(),
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
