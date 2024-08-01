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
       // height: size.height * 0.5,
        margin: EdgeInsets.only(top: AppLayout.getHeight(60)),
        decoration: BoxDecoration(
         color: Styles.primaryColor.withOpacity(.008),
       //   color: Colors.redAccent,
        ),
        child: Padding(
          padding: EdgeInsets.all(AppLayout.getHeight(AppLayout.getHeight(4))),
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
                  moodText: ChipText.CS,
                  chipColor: Styles.mainAppYellowGlow, )],
              ),
              MoodChip(
                moodText: ChipText.TB,
                chipColor:Styles.mainAppPurpleMunsell,
              ),
              MoodChip(
                moodText: ChipText.NC,
                chipColor: Styles.mainAppPaynesGray,
              ),
              // Container(
              //   padding: const EdgeInsets.all(4.0),
              // width: 100,
              //   child: Stack(
              //     //alignment:new Alignment(x, y)
              //     children: <Widget>[
              //       MoodChip(
              //         moodText: ChipText.CS,
              //         chipColor: Styles.mainAppYellowGlow, ),
              //       Positioned(
              //           bottom: 30.0,
              //           child: MoodChip(
              //             moodText: ChipText.TB,
              //             chipColor:Styles.mainAppPurpleMunsell,
              //           )),
              //       Positioned(
              //         bottom: 60.0,
              //         child: MoodChip(
              //           moodText: ChipText.NC,
              //           chipColor: Styles.mainAppPaynesGray,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ));
  }
}
