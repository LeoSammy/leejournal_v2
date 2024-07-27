import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leejournal/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _sheet = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(16)),
        margin: EdgeInsets.only(top: size.height * 0.055),
        child: Text("Here"),
      ),
      bottomSheet: DraggableScrollableSheet(
        key: _sheet,
        initialChildSize: 0.20,
        maxChildSize: 0.85,
        minChildSize: 0.05,
        expand: true,
        snap: true,
        snapSizes: const [0.5],
        controller: DraggableScrollableController(),
        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  const SliverToBoxAdapter(
                    child: Text('Title'),
                  ),
                  SliverList.list(
                    children: const [
                      Text('Content'),
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }
}
