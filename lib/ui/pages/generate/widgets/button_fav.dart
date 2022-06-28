import 'package:flutter/material.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ButtonFav extends StatelessWidget {
  const ButtonFav({
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
            },
            icon: const Icon(Icons.bookmark_add_rounded, color: CustomTheme.whiteColor, size: 35.0),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Text('Guardar', style: TextStyle(
          color: CustomTheme.blackColor,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.center,)
      ],
    );
  }
}