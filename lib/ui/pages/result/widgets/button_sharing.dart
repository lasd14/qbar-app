import 'package:flutter/material.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ButtonSharing extends StatelessWidget {
  const ButtonSharing({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: CustomTheme.rippleColor,
          radius: 35.0,
          child: IconButton(
            onPressed: () {
              onPressed();
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