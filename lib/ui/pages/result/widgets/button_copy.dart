import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ButtonCopy extends StatelessWidget {
  const ButtonCopy({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.scanString,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String text;
  final String scanString;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 35.0,
          child: IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: scanString));
              showToast(
                "✅ Se ha copiado con éxito", 
                context:context,
                animation: StyledToastAnimation.slideFromBottomFade,
                reverseAnimation: StyledToastAnimation.slideToBottomFade,
                startOffset: const Offset(0.0, 8.0),
                reverseEndOffset: const Offset(0.0, 8.0),
                position: StyledToastPosition.bottom,
                duration: const Duration(seconds: 4),
                animDuration: const Duration(milliseconds: 400),
                curve: Curves.linearToEaseOut,
                reverseCurve: Curves.fastOutSlowIn,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                backgroundColor: CustomTheme.primaryColor,
                textStyle: const TextStyle(
                  color: CustomTheme.whiteColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600
                )
              );
            },
            icon: Icon(icon, color: CustomTheme.whiteColor, size: 35.0),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(text, style: const TextStyle(
          color: CustomTheme.blackColor,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.center,)
      ],
    );
  }
}