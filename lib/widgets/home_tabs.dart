import 'package:flutter/material.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/normal_text.dart';

class HomeTabs extends StatelessWidget {
  final String? firstTab;
  final String? secondTab;
  final bool isActiveA;
  final bool isActiveB;
  final bool showWidget;
  final Widget? hWidgetA;
  final Widget? hWidgetB;
  final double? hTabsWidth;

  const HomeTabs({super.key,
    this.firstTab,
    this.secondTab,
    required this.isActiveA,
    required this.isActiveB,
    this.showWidget = false,
    this.hWidgetA,
    this.hWidgetB,
    this.hTabsWidth
  });

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
      child: Container(
        //height: size.height * 0.070,
        height: 55,
        padding: EdgeInsets.all(AppLayout.getHeight(4)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.getHeight(50)),
            color: Styles.whiteCold),
        child: Row(
          children: [
            Container(
              width: showWidget != false ? hTabsWidth : size.width * 0.30,
              padding:
              EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)) ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(AppLayout.getHeight(50)),
                      left: Radius.circular(AppLayout.getHeight(50))),
                  color: Theme.of(context).canvasColor),
              child:  Center(
                  child:  showWidget != false ? hWidgetA : NormalText(
                 active: isActiveA,
                text: firstTab!,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyLarge?.color)),
            ),
            Container(
              width: showWidget != false ? hTabsWidth : size.width * 0.30,
              padding:
              EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(AppLayout.getHeight(50)),
                    left: Radius.circular(AppLayout.getHeight(50)),
                ),
              ),
              child: Center(
                  child: showWidget != false ? hWidgetB : NormalText(
                   active: isActiveB,
                  text: secondTab!,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyLarge?.color)),
            )
          ],
        ),
      ),
    );
  }
}