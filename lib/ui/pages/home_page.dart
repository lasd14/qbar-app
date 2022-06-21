import 'package:flutter/material.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:qbar_app/ui/widgets/buttons_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
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
          Container(
            color: Colors.amber,
            child: Text('Data', style: TextStyle(color: CustomTheme.whiteColor),),
          ),
        ],
      ),
   );
  }
}