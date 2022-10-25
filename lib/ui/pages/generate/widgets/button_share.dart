import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ButtonShare extends StatelessWidget {
  const ButtonShare({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: CustomTheme.rippleColor,
          radius: 35.0,
          child: IconButton(
            onPressed: () {
              final generateBloc = BlocProvider.of<GenerateBloc>(context);
              generateBloc.shareScreenshotQr();
            },
            icon: const Icon(Icons.share, color: CustomTheme.whiteColor, size: 35.0),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Text('Compartir', style: TextStyle(
          color: CustomTheme.blackColor,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.center,)
      ],
    );
  }
}