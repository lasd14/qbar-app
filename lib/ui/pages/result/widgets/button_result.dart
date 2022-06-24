import 'package:flutter/material.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ButtonResult extends StatelessWidget {
  const ButtonResult({
    Key? key,
    required this.color,
    required this.icon
  }) : super(key: key);

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 30.0,
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: CustomTheme.whiteColor, size: 30.0),
      ),
    );
  }
}