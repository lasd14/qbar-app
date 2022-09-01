import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/pages/result/result_page.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:qbar_app/ui/pages/home/widgets/buttons_home.dart';
import 'package:flutter_ripple/flutter_ripple.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final scanBloc = BlocProvider.of<ScanBloc>(context);
    final cameraBloc = BlocProvider.of<CameraBloc>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0)),
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
                onTap: () async {
                  if(cameraBloc.state.cameraPermissionGranted){
                    //TODO: This fragment of code can be upgraded
                    await scanBloc.getScanResult().whenComplete(() => {
                      if (scanBloc.scanResult!.rawContent == '' || scanBloc.scanResult!.type == ResultType.Cancelled || scanBloc.scanResult!.format == BarcodeFormat.unknown) {
                        Navigator.pushReplacementNamed(context, 'home'),
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(scanResult: scanBloc.scanResult,))),
                      }
                    });
                  } else {
                    cameraBloc.cameraAccess();
                  }
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
                    const Text(
                      '!Escanear!',
                      style: TextStyle(
                        color: CustomTheme.whiteColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('¿Qué deseas hacer?',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.blackColor)),
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
                  route: 'generate',
                ),
                ButtonsHome(
                  size: size,
                  colorLight: CustomTheme.greenLightColor,
                  colorDark: CustomTheme.greenDarkColor,
                  icon: Icons.bookmark_rounded,
                  nameIcon: 'Favoritos',
                  route: 'favorites',
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
                  nameIcon: 'Personalizar',
                  route: 'personalize',
                ),
                ButtonsHome(
                  size: size,
                  colorLight: CustomTheme.yellowLightColor,
                  colorDark: CustomTheme.yellowDarkColor,
                  icon: Icons.history_rounded,
                  nameIcon: 'Historial',
                  route: 'history',
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
