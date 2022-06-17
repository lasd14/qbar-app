import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  
  static const primaryColor     = Color(0xFF21325E);
  static const secondaryColor   = Color(0xFF3E497A);
  static const thirdColor       = Color(0xFFF1D00A);
  static const transparentColor = Color(0x00000000);
  static const whiteColor       = Color(0xFFF0F0F0);
  static const lightColor       = Color(0xFF3971A4);
  static const blackColor       = Color(0xFF0E0E10);

  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
      backgroundColor: transparentColor,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: transparentColor,
        statusBarIconBrightness: Brightness.dark,
      )
    ),
  );

}