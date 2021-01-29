import 'package:flutter/material.dart';
import 'package:iris_task/constants.dart';
import 'package:iris_task/results_screen.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:iris_task/networking.dart';

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  Future getPredictions(double sepalLength, double sepalWidth,
      double petalLength, double petalWidth) async {
    var inputs = [
      [sepalLength, sepalWidth, petalLength, petalWidth]
    ];
    var output = List(1 * 3).reshape([1, 3]);
    final interpreter = await tfl.Interpreter.fromAsset('model.tflite');
    interpreter.run(inputs, output);
    print(output);
    return output;
  }

  String sepalLength, sepalWidth, petalLength, petalWidth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sequential Model'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Enter sepal length in cm'),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    sepalLength = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Enter sepal width in cm'),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    sepalWidth = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Enter petal length in cm'),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    petalLength = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Enter petal width in cm'),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    petalWidth = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: () async {
          if (sepalLength == null ||
              sepalWidth == null ||
              petalLength == null ||
              petalWidth == null) {
            FocusScope.of(context).unfocus();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Indadequate data"),
              ),
            );
          } else {
            FocusScope.of(context).unfocus();
            var predictions = await getPredictions(
              double.parse(sepalLength),
              double.parse(sepalWidth),
              double.parse(petalLength),
              double.parse(petalWidth),
            );
            NetworkHelper networkHelper = NetworkHelper(
                url:
                    '$kURL?a=${predictions[0][0].toString()}&b=${predictions[0][1].toString()}&c=${predictions[0][2].toString()}');
            var predictionsData = await networkHelper.getData();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsScreen(
                  predictionData: predictionsData,
                ),
              ),
            );
          }
        },
        label: Text('Predict'),
        icon: Icon(Icons.arrow_right),
      ),
    );
  }
}
