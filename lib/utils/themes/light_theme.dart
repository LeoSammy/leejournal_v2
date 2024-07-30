import 'package:flutter/material.dart';
import 'package:leejournal/utils/styles.dart';

ThemeData lightTheme(){
  return ThemeData(
    useMaterial3: true,
    // brightness: Brightness.light,
    scaffoldBackgroundColor: Styles.bgColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(seedColor: Styles.primaryColor),
    appBarTheme: appBarTheme(),
    cardColor: Styles.bgColor,
    canvasColor: Styles.white100,
    indicatorColor: Styles.primaryColor,
    textTheme: textTheme(),

  );
}

TextTheme textTheme() {
  return TextTheme(
    titleMedium: TextStyle(color: Styles.primaryColor),
    displaySmall: TextStyle(color: Styles.primaryColorDark),
    bodySmall: const TextStyle(color: Styles.textColorWhite),
    bodyMedium: TextStyle(
      color: Styles.textColor,
    ),
    bodyLarge: TextStyle(
      color: Styles.textColor,
    ),
  );
}

AppBarTheme appBarTheme() {
  return  AppBarTheme(
    // color: AppColor.mainColorLight,
    backgroundColor: Styles.bgColor,
    elevation: 0,
    // systemOverlayStyle: SystemUiOverlayStyle(systemNavigationBarColor: Color(0xFFFFFFFF)),
    iconTheme: const IconThemeData(color: Colors.white10),
    toolbarTextStyle: const TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    titleTextStyle: const TextStyle(color: Color(0XFF8B8B8B), fontSize: 16),
  );
}