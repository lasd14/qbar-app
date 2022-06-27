import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:qbar_app/ui/pages/pages.dart';
import 'domain/blocs/blocs.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ScanBloc()),
        BlocProvider(create: (context) => CameraBloc()),
        BlocProvider(create: (context) => GenerateBloc()),
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
      builder: EasyLoading.init(),
      initialRoute: 'home',
      routes: {
        'home'     :(_) => const HomePage(),
        'result'   :(_) => const ResultPage(),
        'generate' :(_) => const GeneratePage(),
      },
    );
  }
}