import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final Widget cardChild;

  const ReusableCard({super.key, required this.color, required this.onTap,required this.cardChild});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.all(10,
        ),
      ),
    );
  }
}