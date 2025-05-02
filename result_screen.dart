import 'package:bmicalculator/components/bottom_button.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String BmiResult;
  final String ResultText;
  final String Interpretation;
  const ResultScreen({super.key, required this.BmiResult, required this.ResultText, required this.Interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: kTitle,
              ),
              padding: EdgeInsets.all(15.0),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(color: KactiveCardColor,
                onTap: () {},
                cardChild: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text(ResultText.toUpperCase(),
                  style: kResultTextStyle,
                  ),

                    Text(BmiResult,
                    style: kbmiTextStyle,
                    ),

                    Text(Interpretation,
                    style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ),
          BottomButton(onTap: () {
            Navigator.pop(context);
          },
              text: 'RECALCULATE'),
        ], //Column Children
      ),
    );
  }
}
