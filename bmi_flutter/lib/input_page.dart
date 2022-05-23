import 'package:bmi_flutter/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'package:bmi_flutter/results_page.dart';
import 'bmi_logic.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  int height = 170;
  int weight = 60;
  int age = 25;

  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    }
    if (gender == 2) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColour(1);
                    },);
                  },
                  child: ReusableCard(
                      maleCardColor, cardChild(FontAwesomeIcons.mars, "MALE")),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColour(2);
                  });
                },
                child: ReusableCard(femaleCardColor,
                    cardChild(FontAwesomeIcons.venus, "FEMALE")),
              ),),
            ],
          ),),
          Expanded(
            child: ReusableCard(
                activeCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height", style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(
                          () {
                            height = newValue.round();
                          },
                        );
                      },
                    ),
                  ],
                ),),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                      activeCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'WEIGHT',
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                onPressed: () {
                                  setState((){
                                    weight--;
                                  },);
                                },
                                child: Icon(FontAwesomeIcons.minus, color: Colors.white),
                              ),
                              SizedBox(width: 10.0,),
                              FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                onPressed: () {
                                  setState((){
                                    weight++;
                                  },);
                                },
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                ),
                Expanded(
                  child: ReusableCard(
                      activeCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                onPressed: () {
                                  setState((){
                                    age--;
                                  },);
                                },
                                child: Icon(FontAwesomeIcons.minus, color: Colors.white),
                              ),
                              SizedBox(width: 10.0,),
                              FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                onPressed: () {
                                  setState((){
                                    age++;
                                  },);
                                },
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      )
                  ),
                ),
              ],
            ),
            ),
          GestureDetector(
            onTap: (){

              BmiLogic calc = BmiLogic(height, weight);


              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),),);
            },
            child: Container(
              child: Center(
                child: Text('CALCULATE',style: TextStyle(
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

class ReusableCard extends StatelessWidget {
  ReusableCard(this.colour, this.cardChild);

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ));
  }
}
