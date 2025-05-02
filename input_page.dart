import 'package:bmicalculator/bmi_screen/result_screen.dart';
import 'package:bmicalculator/calculator_brain.dart';
import 'package:bmicalculator/components/Icon_content.dart';
import 'package:bmicalculator/components/bottom_button.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/components/round_icon_button.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.calculate,
        ),
        title: const Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.help,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: IconContent(
                      icon: Icons.male,
                      text: "Male",
                    ),
                    color: selectedGender == Gender.Male
                        ? KactiveCardColor
                        : KinactiveCardColor,
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: IconContent(
                      icon: Icons.female,
                      text: "Female",
                    ),
                    color: selectedGender == Gender.Female
                        ? KactiveCardColor
                        : KinactiveCardColor,
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: KlabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: KnumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: KlabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0XFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                        min: 0,
                        max: 500,
                        value: height.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        }),
                  )
                ],
              ),
              color: KactiveCardColor,
              onTap: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: KlabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KnumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: CupertinoIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: CupertinoIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: KactiveCardColor,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: KlabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KnumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: CupertinoIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: CupertinoIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: KactiveCardColor,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain abc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ResultScreen(
                    BmiResult: abc.CalculateBmi(),
                    Interpretation: abc.GetInterpretation(),
                    ResultText: abc.GetResult(),

                  ),
                ),
              );
            },
            text: "CALCULATE",
          )
        ],
      ),
    );
  }
}
