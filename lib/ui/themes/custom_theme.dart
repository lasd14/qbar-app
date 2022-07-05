import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  
  //General
  static const primaryColor     = Color(0xFF21325E);
  static const secondaryColor   = Color(0xFF3E497A);
  static const thirdColor       = Color(0xFFF1D00A);
  static const transparentColor = Color(0x00000000);
  static const darkColor        = Color(0xFF0A142E);
  static const whiteColor       = Color(0xFFF0F0F0);
  static const lightColor       = Color(0xFF3971A4);
  static const blackColor       = Color(0xFF0E0E10);

  //Buttons
  static const redLightColor    = Color(0xFFF25858);
  static const redDarkColor     = Color(0xFFA70C0C);
  static const greenLightColor  = Color(0xFF27B74F);
  static const greenDarkColor   = Color(0xFF136128);
  static const blueLightColor   = Color(0xFF1175D1);
  static const blueDarkColor    = Color(0xFF11426F);
  static const yellowLightColor = Color(0xFFD8BF2D);
  static const yellowDarkColor  = Color(0xFF87760D);
  static const rippleColor      = Color(0xFF3E497A);

  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
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