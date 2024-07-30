import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:leejournal/screens/calendar/calendar_view.dart';
import 'package:leejournal/screens/listings/record_listings.dart';
import 'package:leejournal/screens/scheduler/scheduler_page.dart';
import 'package:leejournal/screens/settings/settings_page.dart';
import 'package:leejournal/screens/stats/stats_view.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/widgets.dart';


class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //Styles.primaryColorLight,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              primary: true,
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(AppLayout.getHeight(20)),
                      //   bottomRight: Radius.circular(AppLayout.getHeight(20)),
                      // ),
                     // color: Styles.primaryColor,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/nav_cover.jpg'))),
                  child: Container(
                    padding:EdgeInsets.all(AppLayout.getHeight(8)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                      gradient: const LinearGradient(
                        colors: [Colors.white70, Colors.black26],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => {Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const SettingsPage()))},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Material(
                              elevation: AppLayout.getHeight(20),
                              child: SizedBox(
                              //  color: Styles.white200,
                                height: AppLayout.getHeight(50),
                                width: AppLayout.getHeight(50),
                                //TODO update profile image
                                child: Image.network(
                                    'https://picsum.photos/250?image=64')
                              ),
                            ),
                          ),
                        ),
                        Gap(AppLayout.getHeight(5)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //TODO update to get from local storage
                            NormalText(
                              text: 'Leo Sammy',
                              fontWeight: FontWeight.w700,
                            ),
                            NormalText(
                              text: 'leodev23@mail.com',
                              color: Styles.primaryColorDark,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.view_list_rounded,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  title: NormalText(
                    text: 'Listings',
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  onTap: () => selectedItem(context, 0),
                ),
                ListTile(
                  leading:  Icon(
                    Icons.schedule_outlined,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  title: NormalText(
                    text: 'Scheduler',
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  onTap: () => selectedItem(context, 1),
                ),
                ListTile(
                  leading: Icon(
                    Icons.stacked_bar_chart_outlined,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  title: NormalText(text: 'Stats',
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  onTap: () => selectedItem(context, 2),
                ),
                ListTile(
                  leading: Icon(
                    Icons.calendar_month_outlined,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  title: NormalText(text: 'Calendar',
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,),
                  onTap: () => selectedItem(context, 3),
                ),
                Container(
                    padding:  EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20)),
                    child: const Divider(
                      height: 5,
                      thickness: 2,
                      color: Styles.mainAppYellowGlow,
                    )),
                ListTile(
                  leading:  Icon(
                    Icons.share_outlined,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  title: NormalText(text: 'Share',
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,),
                  onTap: () => selectedItem(context, 4),
                ),
                ListTile(
                  leading:  Icon(
                    Icons.rate_review_outlined,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  title: NormalText(text: 'Rate Us',
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,),
                  onTap: () => selectedItem(context, 5),
                ),
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: SmallText(
              text: 'leodev.com  v1.00',
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ],
      ),
    );
  }

  selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RecordListings()));
        break;
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SchedulerPage()));
        break;
      case 2:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const StatsView()));
        break;
      case 3:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CalendarView()));
        break;
      case 4:
        showModalBottomSheet(context: context,
            backgroundColor: Styles.primaryColorDark.withOpacity(0.5),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight:Radius.circular(20),
                    topLeft: Radius.circular(20))),
            builder: (context) {
            final size = AppLayout.getSize(context);
              return Container(
                  height: size.height * 0.25
              );
            });
        break;
      case 5:
        print('Open link to app on playstore/app store');
        break;
    }
  }
}
