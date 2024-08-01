import 'package:flutter/material.dart';
import 'package:leejournal/utils/utils.dart';

class NormalText extends StatelessWidget {
  Color? color;
  final String text;
  final TextAlign? textAlign;
  double size;
  FontStyle fontStyle;
  FontWeight fontWeight;
  String fontFamily;
  TextOverflow overFlow;
  bool? active;

  NormalText(
      {super.key,
        this.color = const Color(0xFF000000),
        required this.text,
        this.size = 0,
         active = false,
        this.textAlign = TextAlign.start,
        this.fontWeight = FontWeight.normal,
        this.fontStyle = FontStyle.normal,
        this.fontFamily = 'Urbanist',
        this.overFlow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          color: active != false ? color : null,
          fontStyle: fontStyle,
           fontFamily: fontFamily,
          fontSize: size == 0 ? AppLayout.getHeight(14) : size,
          fontWeight: fontWeight),
    );
  }
}