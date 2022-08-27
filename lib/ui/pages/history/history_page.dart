import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/history/history_bloc.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            final historyBloc = BlocProvider.of<HistoryBloc>(context);
            Navigator.pop(context);
            await Future.delayed(const Duration(milliseconds: 500));
            //TODO: EVENTO DE HISTORYBLOC
          }, 
          icon: const Icon(Icons.arrow_back,
              color: CustomTheme.whiteColor, size: 26.0),
        ),
        backgroundColor: CustomTheme.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Historial',
          style: TextStyle(),
        ),
      ),
    );
  }
}