
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/components/speak2note_body.dart';
import 'package:leejournal/widgets/widgets.dart';

class Speak2Note extends StatelessWidget {
  const Speak2Note({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Column(
      children: [
        Expanded(
            child: NestedScrollView(
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
                            text: "New Note",
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.color,
                            fontWeight: FontWeight.w600,
                          )),
                      actions: <Widget>[
                        IconButton(
                            tooltip: "share note",
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
                              print("share note");
                            },
                            icon: Icon(
                              FluentSystemIcons
                                  .ic_fluent_share_ios_regular,
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
                        Speak2NoteBody(initialText: "Here")
                      ],
                    ),
                  ),
                ),
              ),
            )
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(20),
                topLeft: Radius.circular(20))
          ),
          padding: EdgeInsets.all(AppLayout.getHeight(20)),
           margin: EdgeInsets.only(bottom: AppLayout.getSize(context).height * 0.08),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    NeumorphicButton(
                      onPressed: () {
                      },
                      style: const  NeumorphicStyle(
                        shape: NeumorphicShape.convex,
                       // color: Theme.of(context).canvasColor,
                        border: NeumorphicBorder(
                            width: 2,
                            color:Styles.white
                        ),
                        depth: 5,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: NeumorphicIcon(FluentSystemIcons.ic_fluent_mic_on_filled,
                          size: AppLayout.getHeight(28),
                          style: const NeumorphicStyle(
                              color: Styles.mainAppPaynesGray
                            // color: Styles.mainAppDarkMode
                          )),
                    ),
                    Gap(AppLayout.getHeight(8)),
                    Container(child: Text("02:25"),)
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child:  NeumorphicButton(
                  onPressed: () {
                  },
                  style:  const NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    depth: 5,
                    border: NeumorphicBorder(
                        width: 0.5,
                        color:Styles.white
                    ),
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: NeumorphicIcon(Icons.check_circle,
                      size: AppLayout.getHeight(24),
                      style: const NeumorphicStyle(
                          color: Styles.mainAppPaynesGray
                        // color: Styles.mainAppDarkMode
                      )),
                ) ,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child:  NeumorphicButton(
                  onPressed: () {
                  },
                  style:  const NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    depth: 5,
                    border: NeumorphicBorder(
                        width: 0.5,
                        color:Styles.white
                    ),
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: NeumorphicIcon(Icons.cancel_rounded,
                      size: AppLayout.getHeight(24),
                      style: const NeumorphicStyle(
                          color: Styles.mainAppPaynesGray
                        // color: Styles.mainAppDarkMode
                      )),
                ) ,
              )
            ],
          ),
        )
      ],
    );
  }
}
