import 'package:bmicalculator/bmi_screen/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BmiCalculator());


class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(primaryColor: Color(0xFF0A0E21,),
        scaffoldBackgroundColor: Color(0xFF0A0E21,),
      ),
    );
  }
}
