
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  FontWeight fontWeight;
  double height;
  TextOverflow overFlow;

  SmallText(
      {super.key,
        this.color = const Color(0xFF000000),
        required this.text,
        this.fontWeight = FontWeight.normal,
        this.size = 9,
        this.height = 1.2,
        this.overFlow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          color: color,
          fontFamily: 'Urbanist-Thin',
          fontSize: size,
          fontWeight: fontWeight),
    );
  }
}