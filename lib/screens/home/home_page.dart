import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:leejournal/screens/home/audio_view.dart';
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
  late PageController pageController;
  int _currentPage = 0;

  String timeOfDay = tod;
  late List<Widget> pages = [];
  bool _isActiveA = true;
  bool _isActiveB = false;

  bool _isActiveTabA = true;
  bool _isActiveTabB = false;


  @override
  void initState() {
    super.initState();
    pageController = PageController(
      keepPage: true,
    );
    _controller = DraggableScrollableController();
  }

  @override
  void dispose() {
    _controller.dispose();
    pageController.dispose();
    super.dispose();
  }
  void _toggleActiveWidget(){
    setState(() {
      _isActiveA = !_isActiveA;
      _isActiveB = !_isActiveB;

      _currentPage = (_currentPage + 1) % 2;
      pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut);
    });
  }

  void _toggleActiveTab(){
    setState(() {
      _isActiveTabA = !_isActiveTabA;
      _isActiveTabB = !_isActiveTabB;
    });
  }


  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    const String uName = "Leo";
    //Initialize the pages used
    pages = [
      NestedScrollView(
      headerSliverBuilder:
          (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              backgroundColor: Theme.of(context).cardColor,
              automaticallyImplyLeading: false,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          AppLayout.getHeight(10)),
                      topRight: Radius.circular(
                          AppLayout.getHeight(10)))),
              pinned: true,
              expandedHeight: AppLayout.getHeight(70),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                  title: NormalText(
                    text: "New Moment",
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color,
                    fontWeight: FontWeight.w600,
                  )),
              actions: <Widget>[
                IconButton(
                    tooltip: "Save moment",
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppLayout.getHeight(20)),
                          side: BorderSide(
                              width: 0.5,
                              color: Styles.blueColor),
                        ),
                      ),
                      backgroundColor:
                      WidgetStateProperty.all<Color>(
                          Styles.white200),
                    ),
                    onPressed: () {
                      print("Save moment");
                    },
                    icon: Icon(
                      FluentSystemIcons
                          .ic_fluent_checkmark_regular,
                      color: Styles.blueColor,
                    )),
              ]),
        ];
      },
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
          BoxConstraints(minHeight: size.height * 0.50),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                    bottomLeft:
                    Radius.circular(AppLayout.getHeight(10)),
                    bottomRight: Radius.circular(
                        AppLayout.getHeight(10)))),
            padding: EdgeInsets.only(
                bottom: size.height * 0.10,
                left: AppLayout.getHeight(10),
                right: AppLayout.getHeight(10)),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  height: AppLayout.getHeight(8),
                  thickness: AppLayout.getHeight(2),
                  color: Theme.of(context).canvasColor,
                ),
                // Moment Body
                MomentBody(
                  initialText: "Add story...", initTitle: 'Add title...',
                )
              ],
            ),
          ),
        ),
      ),
    ), const AudioView()];

    return Scaffold(
      drawer: const NavBar(),
      body: Container(
          padding: EdgeInsets.only(
            left: AppLayout.getHeight(16),
            right: AppLayout.getHeight(16),
          ),
          margin: EdgeInsets.only(top: size.height * 0.055),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
                padding: EdgeInsets.only(
                    top: AppLayout.getHeight(8), right: AppLayout.getWidth(8)),
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
                            padding: EdgeInsets.only(
                                left: AppLayout.getHeight(10),
                                bottom: AppLayout.getHeight(10),
                                right: AppLayout.getHeight(10)),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                              print("Scaffold drawer called ");
                            },
                            icon: SizedBox(
                              height: AppLayout.getHeight(45),
                              width: AppLayout.getWidth(45),
                              child: SvgPicture.asset(
                                "assets/svg/menu.svg",
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                              ),
                            ),
                            tooltip: MaterialLocalizations.of(context)
                                .openAppDrawerTooltip,
                          );
                        }),
                        Gap(AppLayout.getWidth(5)),
                        // Inbox messages and in app notifications
                        IconButton(
                            onPressed: () {
                              print("object");
                            },
                            icon: Icon(
                              FluentSystemIcons.ic_fluent_mail_inbox_filled,
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            )),
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
                                  NormalText(
                                    text: "Hi",
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                  ),
                                  Gap(AppLayout.getWidth(5)),
                                  //TODO update to show users first name
                                  NormalText(
                                    text: "$uName!",
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                  ),
                                ],
                              ),
                              SmallText(
                                text: "Good $timeOfDay",
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                              )
                            ],
                          ),
                        ),
                        Gap(AppLayout.getWidth(10)),
                        Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(2.0)),
                          decoration: BoxDecoration(
                              color: Styles.goldColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppLayout.getHeight(30)),
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
                  child: Stack(
                children: [
                  //Main body
                 PageView(
                   controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (page){
                     print(page);
                     //create function to switch bottom tab when page is scrolled horizontally
                    },
                   children:pages,
                 ),
                  //journal switch

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(bottom: size.height * 0.060),
                      child: HomeTabs(
                          contHeight: AppLayout.getHeight(52),
                          hTabsWidth: size.width * 0.125,
                          showWidget: true,
                          hWidgetA: InkWell(
                        onTap:  _toggleActiveWidget,
                            //     () {
                            //   _toggleActiveWidget;
                            //   print(_isActive);
                            //   print("show text-pad page");
                            // },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                  FluentSystemIcons
                                      .ic_fluent_pen_settings_regular,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color),
                            ),
                          ),
                        aColor:_isActiveA ? Theme.of(context).canvasColor : Colors.transparent,
                          hWidgetB: InkWell(
                            onTap: _toggleActiveWidget,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                  FluentSystemIcons.ic_fluent_mic_on_regular,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color),
                            ),
                          ),
                        bColor: _isActiveB ? Theme.of(context).canvasColor : Colors.transparent,
                       ),
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
                      child: HomeTabs(
                        aColor: _isActiveTabA ? Theme.of(context).canvasColor : Colors.transparent,
                        bColor: _isActiveTabB ? Theme.of(context).canvasColor :  Colors.transparent,
                        firstTab: "Journal",
                        secondTab: "Speak2Note",
                      ),
                    ),
                  ),
                ],
              )),
            ],
          )),
      bottomSheet: DraggableBottom(controller: _controller),
    );
  }


  switchMemoAudio(){
   var view =   pageController.page;
   return view;
  }
}
