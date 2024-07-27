import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leejournal/screens/home_page.dart';
import 'package:leejournal/utils/themes/dark_theme.dart';
import 'package:leejournal/utils/themes/light_theme.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await deb.initDependencies();
  //await GetStorage.init();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const LeeJournalApp(), // Wrap your app
  ),
  );
}

// Future <void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await deb.initDependencies();
//   await GetStorage.init();
//   runApp(LeeJournalApp());
// }


class LeeJournalApp extends StatelessWidget {
  const LeeJournalApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeLight = lightTheme();
    final themeDark = darkTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LeeJournal',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: themeLight,
      darkTheme: themeDark,
      home: const HomePage(),
    );
  }
}



