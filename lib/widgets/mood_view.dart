import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/components/mood_chip.dart';
import 'package:leejournal/widgets/widgets.dart';

class MoodView extends StatelessWidget {
  const MoodView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
        width: size.width * 0.15,
        margin: EdgeInsets.only(top: size.height * 0.15),
        decoration: BoxDecoration(
         color: Styles.primaryColor.withOpacity(.008),
       //   color: Colors.redAccent,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmallText(
                text: 'Mood',
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontWeight: FontWeight.w600,
              ),
              Gap(AppLayout.getHeight(10)),
              Stack(
                children:[
                  MoodChip(
                    //mSize: ,
                  moodText: ChipText.CS,
                  chipColor: Styles.mainAppYellowGlow, ),
                ],
              ),
              MoodChip(
                moodText: ChipText.TB,
                chipColor:Styles.mainAppPurpleMunsell,
              ),
              MoodChip(
                moodText: ChipText.UC,
                chipColor: Styles.mainAppPaynesGray,
              ),
            ],
          ),
        );
  }
}
