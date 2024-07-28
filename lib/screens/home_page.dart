import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leejournal/utils/app_layout.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/components/draggable_bottom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(16)),
        margin: EdgeInsets.only(top: size.height * 0.055),
        child: Column(
          children: [
            Container(
              //color: Colors.red,
              height: size.height * 0.10,
              child: Row(
                children: [
                   InkWell(
                     borderRadius: BorderRadius.circular(AppLayout.getHeight(25)),
                     onTap: (){
                       print("show side naviagation");
                     },
                     child: Container(
                       
                       height: AppLayout.getHeight(50),
                       width: AppLayout.getWidth(50),
                         // color: Colors.redAccent
                       padding: EdgeInsets.all(AppLayout.getHeight(8)),
                       child: SvgPicture.asset("assets/svg/menu.svg", color: Styles.iconColor,),),
                   ),
                  Text('Jane Doe'),
                  Text('Jane Doe'),
                ],
              ),
            ),
          ],
        )
      ),
     // bottomSheet: DraggableBottom(controller: _controller),
    );
  }
}
