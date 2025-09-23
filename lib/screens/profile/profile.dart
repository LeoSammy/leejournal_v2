import 'package:flutter/material.dart';
import 'package:leejournal/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.25,
            decoration: BoxDecoration(
              color: Styles.primaryColorLight,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppLayout.getHeight(150)),
                    bottomRight: Radius.circular(AppLayout.getHeight(150)))
            ),),
          Container(
            height: size.height * 0.20,
            decoration: BoxDecoration(
              color: Styles.primaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppLayout.getHeight(150)),
                  bottomRight: Radius.circular(AppLayout.getHeight(150)))
            ),),
          Container(
            height: size.height * 0.15,
            decoration: BoxDecoration(
            color: Styles.primaryColorDark,
              borderRadius:   BorderRadius.only(bottomLeft: Radius.circular(AppLayout.getHeight(150)),
                    bottomRight: Radius.circular(AppLayout.getHeight(150)))
          ),),
          Positioned(
            top: size.height * 0.15 - AppLayout.getHeight(60)/2,
            left: size.width/2 - AppLayout.getWidth(60)/2,
            child: Container(
              padding: EdgeInsets.all(AppLayout.getHeight(2.0)),
              decoration: BoxDecoration(
                  color: Styles.white100,
                  borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(AppLayout.getHeight(30)),
                child: SizedBox(
                  height: AppLayout.getHeight(60),
                  width: AppLayout.getWidth(60),
                  child: Image.network(
                      'https://picsum.photos/250?image=64'),
                ),
              ),
            ),
          ),
          Positioned (
            top: size.height * 0.05,
            right: AppLayout.getWidth(20),
            child: Container(
              padding: EdgeInsets.all(AppLayout.getHeight(10)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
              ),
              child: Icon(Icons.settings_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
