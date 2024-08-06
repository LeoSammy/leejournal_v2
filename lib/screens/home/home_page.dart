import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/components/draggable_bottom.dart';
import 'package:leejournal/widgets/components/moment_body.dart';
import 'package:leejournal/widgets/components/nav_bar.dart';
import 'package:leejournal/widgets/home_tabs.dart';
import 'package:leejournal/widgets/mood_view.dart';
import 'package:leejournal/widgets/normal_text.dart';
import 'package:leejournal/widgets/small_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // final _sheet = GlobalKey();
 // final _controller = DraggableScrollableController();
  late DraggableScrollableController _controller;
  String timeOfDay = tod;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _controller = DraggableScrollableController();
  }


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
              padding: EdgeInsets.only(top: AppLayout.getHeight(8), right: AppLayout.getWidth(8)),
              height: size.height * 0.085,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //Side navigation menu
                      Builder(builder: (BuildContext context) {
                        return IconButton(
                          padding: EdgeInsets.only(left: AppLayout.getHeight(10),
                              bottom: AppLayout.getHeight(10),
                              right: AppLayout.getHeight(10)),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                            print("Scaffold drawer called ");
                          },
                          icon: SizedBox(
                            height: AppLayout.getHeight(45),
                            width: AppLayout.getWidth(45),
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
            Expanded(
                child: Container(
              //  color: Colors.blue,
                  child: Stack(
                    children: [
                      //Main body
                      SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: size.height * 0.50
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.075,
                              ),
                          padding: EdgeInsets.only(
                              bottom: size.height * 0.10,left: AppLayout.getHeight(10),
                              right: AppLayout.getHeight(10)),
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(AppLayout.getHeight(8))
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                     style: ButtonStyle(
                                       shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                         RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                                           side: BorderSide(
                                               width: 0.5,
                                               color: Styles.blueColor),
                                         ),
                                       ),
                                       backgroundColor:  WidgetStateProperty.all<Color>(Colors.white),
                                     ),
                                      onPressed: () {
                                    print("Get back");
                                  }, icon: const Icon(FluentSystemIcons.ic_fluent_arrow_left_regular)),
                                  NormalText(text: "New Moment",
                                    color: Theme.of(context).textTheme.bodyLarge?.color,
                                    fontWeight: FontWeight.w600,),
                                  IconButton(
                                      style: ButtonStyle(
                                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                                            side: BorderSide(
                                                width: 0.5,
                                                color: Styles.blueColor),
                                          ),
                                        ),
                                        backgroundColor:  WidgetStateProperty.all<Color>(Styles.white200),
                                      ),
                                      onPressed: () {
                                        print("Save moment");
                                      }, icon: const Icon(FluentSystemIcons.ic_fluent_checkmark_regular)),
                                ],
                              ),
                              Divider(
                                height: AppLayout.getHeight(8),
                                thickness: AppLayout.getHeight(2),
                                color: Theme.of(context).canvasColor,
                              ),
                              // Moment Body
                              MomentBody(initialText: "Add story...",)

                            ],
                          ),
                        ),
                      ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.only(bottom:size.height * 0.060),
                          child: HomeTabs(
                              hTabsWidth: size.width * 0.125,
                              showWidget: true,
                              hWidgetA: InkWell(
                                onTap: (){
                                  print("show text-pad page");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(FluentSystemIcons.ic_fluent_pen_settings_regular,
                                      color: Theme.of(context).textTheme.bodyLarge?.color
                                  ),
                                ),
                              ),
                              hWidgetB:  InkWell(
                                onTap: (){
                                  print("show microphone page");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(FluentSystemIcons.ic_fluent_mic_on_regular,
                                      color: Theme.of(context).textTheme.bodyLarge?.color
                                  ),
                                ),
                              ),
                              isActiveA: false,
                              isActiveB: false),
                        ),
                      ),
                      // Mood selector
                      const Align(
                        alignment: Alignment.topRight,
                        child: MoodView(),
                      ),
                      //Top Journal and/or Speech to Note tab selector.
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: AppLayout.getHeight(5)),
                          child: const HomeTabs(firstTab: "Journal" ,
                            secondTab: "Speak2Note",
                            isActiveA: false,
                            isActiveB: false,),
                        ),
                      ),

                    ],
                  ),
                )
            ),
          ],
        )
      ),
     bottomSheet: DraggableBottom(controller: _controller),

    );
  }
}


