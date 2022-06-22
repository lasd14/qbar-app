import 'package:flutter/material.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:qbar_app/ui/widgets/buttons_home.dart';
import 'package:flutter_ripple/flutter_ripple.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomTheme.primaryColor,
                  CustomTheme.darkColor
                ]
              ),
            ),
            child: FlutterRipple(
              duration: const Duration(seconds: 6),
              radius: 100,
              rippleColor: CustomTheme.rippleColor,
              rippleShape: BoxShape.circle,
              onTap: () {
                print('Funciona wei');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Image.asset(
                    'assets/qrcode.png',
                    scale: 2.5,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text('!Escanear!', style: TextStyle(
                    color: CustomTheme.whiteColor,
                  ),)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('¿Qué deseas hacer?', style: TextStyle(
            fontSize: 20.0, 
            fontWeight: FontWeight.bold, 
            color: CustomTheme.blackColor
          )),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonsHome(
                size: size, 
                colorLight: CustomTheme.redLightColor, 
                colorDark: CustomTheme.redDarkColor, 
                icon: Icons.add_rounded, 
                nameIcon: 'Generar',
              ),
              ButtonsHome(
                size: size, 
                colorLight: CustomTheme.greenLightColor, 
                colorDark: CustomTheme.greenDarkColor, 
                icon: Icons.bookmark_rounded, 
                nameIcon: 'Favoritos',
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonsHome(
                size: size, 
                colorLight: CustomTheme.blueLightColor, 
                colorDark: CustomTheme.blueDarkColor, 
                icon: Icons.share_rounded, 
                nameIcon: 'Compartir',
              ),
              ButtonsHome(
                size: size, 
                colorLight: CustomTheme.yellowLightColor, 
                colorDark: CustomTheme.yellowDarkColor, 
                icon: Icons.history_rounded, 
                nameIcon: 'Historial',
              ),
            ],
          )
        ],
      ),
   );
  }
}