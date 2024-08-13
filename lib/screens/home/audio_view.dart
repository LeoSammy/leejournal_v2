import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/widgets.dart';

class AudioView extends StatefulWidget {
  const AudioView({Key? key}) : super(key: key);

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  OverlayEntry? overlayEntry;

  final GlobalKey _sKey = GlobalKey();
  final GlobalKey _myKey1 = GlobalKey();
  final GlobalKey _myKey2 = GlobalKey();
  final GlobalKey _myKey3 = GlobalKey();

  get size => null;
  //final recorder = RecordSound();

  @override
  void initState() {
  //  recorder;
    super.initState();
  }

  @override
  void dispose() {
  //  recorder.dispose();
    overlayEntry?.dispose();
    super.dispose();
  }

  //List<Widget> get myList => moodViewList;
  late final stackItems = [
    GestureDetector(
      key: _myKey3,
      onTap: () {
        _swapIndex(_myKey3);
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            border: const NeumorphicBorder(
                width: 0.5, color: Styles.mainAppPaynesGray),
            depth: 5,
            intensity: 0.50,
            surfaceIntensity: 0.25,
            lightSource: LightSource.topLeft,
            color: Theme.of(context).indicatorColor,
          ),
          child: SizedBox(
              height: AppLayout.getHeight(180),
              width: AppLayout.getWidth(180),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //recordVideo(AppColor.mainAppPaynesGray),
                      NeumorphicButton(
                        onPressed: () {
                          _swapIndex(_myKey3);
                          _showVideoOverlay(context);
                        },
                        style: const NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          border: NeumorphicBorder(
                              width: 3,
                              color:Styles.mainAppPaynesGray),
                          depth: 5,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: NeumorphicIcon(FluentSystemIcons.ic_fluent_video_regular,
                            size:AppLayout.getHeight(15),
                            style: const NeumorphicStyle(
                                color: Styles.mainAppDarkMode)),
                      ),
                      Gap(AppLayout.getHeight(8)),
                      // recordAudio(AppColor.mainAppPaynesGray),
                      NeumorphicButton(
                        onPressed: () {
                          _swapIndex(_myKey3);
                          _showAudioOverlay(context, "Not So Cool",
                              Styles.mainAppPaynesGray);
                        },
                        style: const NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          border: NeumorphicBorder(
                              width: 3,
                              color: Styles.mainAppPaynesGray),
                          depth: 5,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: NeumorphicIcon( FluentSystemIcons.ic_fluent_mic_on_regular,
                            size: AppLayout.getHeight(15),
                            style: const NeumorphicStyle(
                                color: Styles.mainAppDarkMode)),
                      )
                    ],
                  ),
                  Gap(AppLayout.getHeight(10)),
                  NormalText(
                    text: 'Not So Cool',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  )
                ],
              )),
        ),
      ),
    ),
    GestureDetector(
      key: _myKey2,
      onTap: () {
        _swapIndex(
          _myKey2,
        );
      },
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            border: const NeumorphicBorder(
                width: 0.5, color: Styles.mainAppPurpleMunsell),
            depth: 5,
            intensity: 0.50,
            surfaceIntensity: 0.25,
            lightSource: LightSource.topLeft,
              color: Theme.of(context).indicatorColor,
          ),
          child: SizedBox(
              height: AppLayout.getHeight(180),
              width: AppLayout.getWidth(180),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //     recordVideo(AppColor.mainAppPurpleMunsell),
                      NeumorphicButton(
                        onPressed: () {
                          _swapIndex(_myKey2);
                          _showVideoOverlay(context);
                        },
                        style: const NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          border: NeumorphicBorder(
                              width: 3,
                              color: Styles.mainAppPurpleMunsell),
                          depth: 5,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: NeumorphicIcon(FluentSystemIcons.ic_fluent_video_regular,
                            size: AppLayout.getHeight(15),
                            style: const NeumorphicStyle(
                                color: Styles.mainAppDarkMode)),
                      ),
                      Gap(AppLayout.getHeight(8)),
                      //   recordAudio(AppColor.mainAppPurpleMunsell)
                      NeumorphicButton(
                        onPressed: () {
                          _swapIndex(_myKey2);
                          _showAudioOverlay(context, "Take Back",
                              Styles.mainAppPurpleMunsell);
                        },
                        style: const NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          border: NeumorphicBorder(
                              width:3,
                              color: Styles.mainAppPurpleMunsell),
                          depth: 5,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: NeumorphicIcon( FluentSystemIcons.ic_fluent_mic_on_regular,
                            size: AppLayout.getHeight(15),
                            style: const NeumorphicStyle(
                                color: Styles.mainAppDarkMode)),
                      )
                    ],
                  ),
                  Gap(AppLayout.getHeight(10)),
                  NormalText(
                    text: 'Take Back',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  )
                ],
              )),
        ),
      ),
    ),
    GestureDetector(
      key: _myKey1,
      onTap: () {
        _swapIndex(_myKey1);
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            border: const NeumorphicBorder(
                width: 0.5, color:Styles.mainAppYellowGlow),
            depth: 5,
            intensity: 0.50,
            surfaceIntensity: 0.25,
            lightSource: LightSource.topLeft,
            color: Theme.of(context).indicatorColor,
          ),
          child: SizedBox(
              height: AppLayout.getHeight(180),
              width: AppLayout.getWidth(180),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //  recordVideo(AppColor.mainAppYellowGlow),
                      NeumorphicButton(
                        onPressed: () {
                          _swapIndex(_myKey1);
                          _showVideoOverlay(context);
                        },
                        style: const NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          border: NeumorphicBorder(
                              width: 3,
                              color: Styles.mainAppYellowGlow),
                          depth: 5,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: NeumorphicIcon(FluentSystemIcons.ic_fluent_video_regular,
                            size: AppLayout.getHeight(15),
                            style: const NeumorphicStyle(
                                color: Styles.mainAppDarkMode)),
                      ),
                      Gap(AppLayout.getWidth(8)),
                      NeumorphicButton(
                        onPressed: () {
                          _swapIndex(_myKey1);
                          _showAudioOverlay(context, "Cool Stuff",
                              Styles.mainAppYellowGlow);
                        },
                        style: const NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          border: NeumorphicBorder(
                              width: 3,
                              color: Styles.mainAppYellowGlow),
                          depth: 5,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: NeumorphicIcon(
  FluentSystemIcons.ic_fluent_mic_on_regular,
                            size: AppLayout.getHeight(15),
                            style: const NeumorphicStyle(
                                color: Styles.mainAppDarkMode)),
                        // child:Icon( recorder.soundRecorder.isRecording ? AppIcons.stop: AppIcons.mic_1),
                      )
                    ],
                  ),
                  Gap(AppLayout.getHeight(10)),
                  NormalText(
                    text: 'Cool Stuff',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                ],
              )),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    final size = AppLayout.getSize(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: size.height * 0.060),
        height: size.height * 0.50,
        padding: const EdgeInsets.all(8.0),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Stack(
            key: _sKey,
            children: stackItems,
          ),
        ),
      ),
    );
  }

  void _swapIndex(GlobalKey wKey) {
    final renderedWidget = _sKey.currentWidget
    as Stack; //Get the specific widget associated with global key  and cast it as a Stack (Must be a subtype of Stack)
    int currIndex = renderedWidget.children.indexOf(wKey.currentWidget!);
    int topIndex = stackItems.length -
        1; //Given the moodViewList has only 3 elements, compute the index of topmost widget and return that widget
    if (currIndex == 1 || currIndex == 0) {
      setState(() {
        final temp = stackItems[currIndex];
        stackItems[currIndex] = stackItems[topIndex];
        stackItems[topIndex] = temp;
      });
    } else if (currIndex == 2) {
      print('leave as is');
    }
  }

  // Future _recordAudio() async {
  //   final recStatus = recorder.soundRecorder!.isRecording;
  //   if (recStatus) {
  //     await recorder.stopRecord();
  //     setState(() {});
  //   } else {
  //     await recorder.startRecord();
  //     setState(() {});
  //   }
  // }

  void _showAudioOverlay(
      BuildContext context,
      String text,
      Color color,
      ) {
    var moodColor = Styles.primaryColorLight;
    moodColor = color;
    final moodText = text;
    overlayEntry = OverlayEntry(
        opaque: true,
        builder: (context) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _hideOverlay();
            },
            child: Scaffold(
              body: Align(
                child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(100)),
                    border: NeumorphicBorder(width: 0.5, color: moodColor),
                    depth: 5,
                    intensity: 0.50,
                    surfaceIntensity: 0.25,
                    lightSource: LightSource.topLeft,
                      color: Theme.of(context).indicatorColor,
                  ),
                  child: SizedBox(
                      height: AppLayout.getHeight(180),
                      width: AppLayout.getWidth(180),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NeumorphicButton(
                                onPressed: () {
                                  //_recordAudio();
                                },
                                //TODO to be edited to take context color
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.convex,
                                  border: NeumorphicBorder(
                                      width: 3,
                                      color: moodColor),
                                  depth: 5,
                                  boxShape: const NeumorphicBoxShape.circle(),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: NeumorphicIcon(
                                 //   recorder.soundRecorder!.isRecording
                                  size == 0
                                        ? Icons.stop
                                        : Icons.mic_external_off_outlined,
                                    size: AppLayout.getHeight(15),
                                    style: const NeumorphicStyle(
                                        color: Styles.mainAppDarkMode)),
                                // child:Icon( recorder.soundRecorder.isRecording ? AppIcons.stop: AppIcons.mic_1),
                              )
                            ],
                          ),
                          Gap(AppLayout.getHeight(10)),
                          NormalText(
                            text: moodText,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.titleMedium!.color,
                          ),
                        ],
                      )),
                ),
              ),
            ),
          );
        });

    // inserting overlay entry
    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  void _hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void _showVideoOverlay(BuildContext context) {}
}
