import 'package:flutter/material.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ButtonsHome extends StatelessWidget {
  const ButtonsHome({
    Key? key, 
    required this.size, 
    required this.colorLight,
    required this.colorDark,
    required this.icon,
    required this.nameIcon,
    required this.route
  }) : super(key: key);

  final Size size;
  final Color colorLight;
  final Color colorDark;
  final IconData icon;
  final String nameIcon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.17,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorLight,
              colorDark
            ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: CustomTheme.whiteColor, size: 55.0,),
            Text(nameIcon, style: const TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold, fontSize: 16.0),),
          ],
        ),
      ),
    );
  }
}