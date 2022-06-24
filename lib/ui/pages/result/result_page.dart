import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:qbar_app/ui/pages/result/widgets/button_result.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, this.scanResult}) : super(key: key);

  final ScanResult? scanResult;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {}, 
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
            margin: const EdgeInsets.all(30.0),
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
                  Image.asset(
                    'assets/qrcode_b.png',
                    scale: 1.5,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(scanResult!.format.toString(), style: const TextStyle(
                    color: CustomTheme.darkColor, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(scanResult!.rawContent, style: const TextStyle(
                    color: CustomTheme.darkColor, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 16.0, 
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
            children: const [
              ButtonResult(color: CustomTheme.greenLightColor, icon: Icons.share,),
              ButtonResult(color: CustomTheme.blueLightColor, icon: Icons.copy,),
              ButtonResult(color: CustomTheme.redLightColor, icon: Icons.open_in_browser,),
            ],
          )
        ],
      ),
    );
  }
}