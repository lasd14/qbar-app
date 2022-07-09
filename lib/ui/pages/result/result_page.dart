import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/pages/result/widgets/button_access.dart';
import 'package:qbar_app/ui/pages/result/widgets/button_copy.dart';
import 'package:qbar_app/ui/pages/result/widgets/button_save.dart';
import 'package:qbar_app/ui/pages/result/widgets/button_sharing.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, this.scanResult}) : super(key: key);

  final ScanResult? scanResult;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final parseUrl = Uri.parse(scanResult!.rawContent);
    final scanBloc = BlocProvider.of<ScanBloc>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: const Icon(Icons.arrow_back, color: CustomTheme.whiteColor, size: 26.00),
        ),
        backgroundColor: CustomTheme.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('QR Escaneado', style: TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Card(
            elevation: 0,
            margin: const EdgeInsets.only(top: 60.0, left: 40.0, right: 40.0, bottom: 40.0),
            child: Container(
              height: size.height * 0.45,
              width: size.width * 0.90,
              decoration: BoxDecoration(
              color: CustomTheme.whiteColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: CustomTheme.blackColor.withOpacity(0.4),
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                  offset: const Offset(4, 8)
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  scanBloc.getScreenshotCodeScanned(scanResult!.rawContent),
                  Text(scanResult!.format.toString().toUpperCase(), style: const TextStyle(
                    color: CustomTheme.darkColor, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(scanResult!.rawContent, style: const TextStyle(
                    color: CustomTheme.darkColor, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 14.0, 
                    overflow: TextOverflow.ellipsis), maxLines: 1, textAlign: TextAlign.center),
                ],
              ),
            ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonCopy(color: CustomTheme.rippleColor, icon: Icons.copy, text: 'Copiar', scanString: scanResult!.rawContent),
              ButtonAccess(color: CustomTheme.rippleColor, icon: Icons.open_in_browser, text: 'Acceder', url: parseUrl),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonSharing(onPressed: () {scanBloc.shareScreenshotCodeScanned();},),
              ButtonSave(color: CustomTheme.rippleColor, icon: Icons.bookmark, text: 'Guardar', scanResult: scanResult!.rawContent,),
            ],
          )
        ],
      ),
    );
  }
}