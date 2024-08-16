import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/widgets.dart';

class MoodChip extends StatelessWidget {
  final ChipText moodText;
  int? moodCount;
  final Color? chipColor;
  final double? mSize;

  MoodChip({
    super.key,
    required this.moodText,
    this.moodCount,
    this.mSize,
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
          height:  mSize ?? AppLayout.getHeight(32),
          width:  AppLayout.getHeight(32),
          child: Center(
            child: Transform.rotate(
              angle: -45 * math.pi / 180,
              child: SmallText(
                fontWeight: FontWeight.w600,
                text: moodText.name,
                color: Theme.of(context).textTheme.bodyLarge!.color,
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
  UC, //Not Cool Stuff
}
