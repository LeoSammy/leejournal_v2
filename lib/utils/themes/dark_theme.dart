import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leejournal/utils/styles.dart';

ThemeData darkTheme() {
  return ThemeData(
      useMaterial3: true,
      // brightness: Brightness.dark,
      scaffoldBackgroundColor: Styles.bgColorDark,
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardColor: Styles.bgColorDark,
      canvasColor: Styles.bgColorDark,
      indicatorColor: Styles.primaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: Styles.primaryColorDark)
    // colorScheme: ColorScheme.dark(
    //     background: Styles.bgColorDark,
    //     tertiary: Colors.grey[200],
    //     primary: AppColor.mainColor,
    //     secondary: AppColor.mainVariantLight,
    //     onSecondary: AppColor.kblue),
  );
}

TextTheme textTheme() {
  return TextTheme(
    titleMedium: const TextStyle(color: Styles.textColorWhite),
    displaySmall:  TextStyle(color: Styles.primaryColorDark),
    bodyMedium: TextStyle(
      color: Styles.textColorWhite.withOpacity(0.5),
    ),
    bodySmall: const TextStyle(color: Styles.textColorWhite),
    bodyLarge: const TextStyle(
      color:Styles.textColorWhite,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    //color: AppColor.mainColorLight,
    backgroundColor: Styles.bgColorDark,
    elevation: 0,
   // systemOverlayStyle: SystemUiOverlayStyle(systemNavigationBarColor: Color(0xFF0C0C0C)),
    iconTheme: const IconThemeData(color: Colors.white10),
    toolbarTextStyle: const TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    titleTextStyle: const TextStyle(color: Color(0XFF8B8B8B), fontSize: 16),
  );
}