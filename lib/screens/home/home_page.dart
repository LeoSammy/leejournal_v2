import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/components/nav_bar.dart';
import 'package:leejournal/widgets/normal_text.dart';
import 'package:leejournal/widgets/small_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  String timeOfDay = tod;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    const String uName = "Leo";

    return Scaffold(
      drawer: const NavBar(),
      body: Container(
        padding: EdgeInsets.only(left: AppLayout.getHeight(16),
            right: AppLayout.getHeight(16),),
        margin: EdgeInsets.only(top: size.height * 0.055),
        child: Column(
          children: [
            Container(
              //color: Colors.red,
              height: size.height * 0.08,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //Side navigation menu
                      Builder(builder: (BuildContext context) {
                        return IconButton(
                          padding: EdgeInsets.all(AppLayout.getHeight(12)),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                            print("Scaffold drawer called ");
                          },
                          icon: SizedBox(
                            height: AppLayout.getHeight(50),
                            width: AppLayout.getWidth(50),
                            child: SvgPicture.asset("assets/svg/menu.svg",
                              color: Theme.of(context).textTheme.bodyLarge?.color,),),
                          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                        );
                      }),
                      Gap(AppLayout.getWidth(5)),
                      // Inbox messages and in app notifications
                      IconButton(onPressed: (){print("object");},
                          icon:  Icon(FluentSystemIcons.ic_fluent_mail_inbox_filled,
                            color: Theme.of(context).textTheme.bodyLarge?.color,)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Container(
                       margin: EdgeInsets.only(top: AppLayout.getHeight(5)),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             children: [
                               NormalText(text: "Hi",
                                 fontWeight: FontWeight.w600,
                                 color: Theme.of(context).textTheme.bodyLarge?.color,),
                               Gap(AppLayout.getWidth(5)),
                               //TODO update to show users first name
                               NormalText(text: "$uName!",
                                   fontWeight: FontWeight.w600,
                                 color: Theme.of(context).textTheme.bodyLarge?.color,),
                             ],
                           ),
                           SmallText(text: "Good $timeOfDay",
                             color: Theme.of(context).textTheme.bodyLarge?.color,)
                         ],
                       ),
                     ),
                      Gap(AppLayout.getWidth(10)),
                      Container(
                        padding:
                        EdgeInsets.all(AppLayout.getHeight(2.0)),
                        decoration: BoxDecoration(
                            color: Styles.goldColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              AppLayout.getHeight(30)),
                          child: SizedBox(
                            height: AppLayout.getHeight(45),
                            width: AppLayout.getWidth(45),
                            child: Image.network(
                                'https://picsum.photos/250?image=64'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child:  Container(
              color: Colors.blueGrey,
              ))

          ],
        )
      ),
    //bottomSheet: DraggableBottom(controller: _controller),
    );
  }
}


