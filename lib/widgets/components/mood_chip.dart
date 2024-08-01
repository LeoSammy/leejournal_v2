import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/widgets.dart';

class MoodChip extends StatelessWidget {
  final ChipText moodText;
  int? moodCount;
  final Color? chipColor;

  MoodChip({
    super.key,
    required this.moodText,
    this.moodCount,
    required this.chipColor,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: 45 * math.pi / 180,
        child: Container(
          decoration: BoxDecoration(
              color: chipColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(width: 2.0, color: Styles.primaryColorLight),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3.0, 0.0),
                  color: Colors.grey,
                )
              ]),
          height: AppLayout.getHeight(33),
          width:  AppLayout.getHeight(33),
          child: Center(
            child: Transform.rotate(
              angle: -45 * math.pi / 180,
              child: NormalText(
                fontWeight: FontWeight.w500,
                text: moodText.name,
              ),
            ),
          ),
        ));
  }
}

//Enum for chip text
enum ChipText {
  CS, //Good Stuff
  TB, //Take back
  NC, //Not Cool Stuff
}
