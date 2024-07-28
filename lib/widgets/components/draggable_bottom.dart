import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:leejournal/utils/utils.dart';

class DraggableBottom extends StatefulWidget {
  final DraggableScrollableController controller;
  const DraggableBottom({super.key, required this.controller});

  @override
  State<DraggableBottom> createState() => _DraggableBottomState();
}

class _DraggableBottomState extends State<DraggableBottom> {
 // final _controller = DraggableScrollableController();
  final _sheet = GlobalKey();

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: _sheet,
      initialChildSize: 0.20,
      maxChildSize: 0.85,
      minChildSize: 0.058,
      expand: true,
      snap: true,
      snapSizes: const [0.5],
      controller: widget.controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppLayout.getHeight(25)),
                topRight: Radius.circular(AppLayout.getHeight(25)),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child:  Center(
                    child: Container(
                      height: AppLayout.getHeight(4),
                      width: AppLayout.getWidth(40),
                      margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(10)),
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius: BorderRadius.all( Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),

                  ),
                ),
                // const SliverAppBar(
                //   title: Text('My App'),
                //   primary: false,
                //   pinned: true,
                //   centerTitle: false,
                // ),
                SliverList.list(
                  children: const [
                    ListTile(title: Text('Jane Doe')),
                    ListTile(title: Text('Jack reacher'))
                  ],
                ),
              ],
            ));
      },
    );
  }
}
