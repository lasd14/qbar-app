import 'package:flutter/material.dart';
import 'package:qbar_app/custom_theme.dart';
import 'package:qbar_app/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qbar',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      initialRoute: 'home',
      routes: {
        'home':(_) => const HomePage()
      },
    );
  }
}