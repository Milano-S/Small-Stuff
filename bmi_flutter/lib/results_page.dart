import 'package:bmi_flutter/input_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({
    required this.interpretation,
    required this.bmiResult,
    required this.resultText,
});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0
                ),),
              ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              activeCardColor,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  resultText.toUpperCase(),
                  style: TextStyle(
                    color: Color(0xFF24D876),
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bmiResult,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                ),
                Text(
                    interpretation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                )
              ],
            )
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text('RE-CALCULATE',style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 10),
              height: 90,
            ),
          )
        ],
      ),
    );
  }
}
