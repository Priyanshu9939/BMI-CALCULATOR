import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kbottomBarHeight,
        color: kbottomBarColor,
        padding: EdgeInsets.only(
          bottom: 15.0,
        ),
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        // width: double.infinity,
        child: Center(
          child: Text(text,
          style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
