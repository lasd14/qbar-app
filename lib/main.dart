import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/camera/camera_bloc.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:qbar_app/ui/pages/home_page.dart';

import 'domain/blocs/blocs.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ScanBloc()),
        BlocProvider(create: (context) => CameraBloc())
      ], 
      child: const MyApp()
    )
  );
}

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