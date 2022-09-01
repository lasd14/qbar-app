import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/data/database/tables.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PersonalizeQrPage extends StatelessWidget {
  const PersonalizeQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final generateBloc = BlocProvider.of<GenerateBloc>(context);
    final favoriteQR = ModalRoute.of(context)!.settings.arguments as Favorites;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: const Text('Personaliza el Código QR', style: TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0
            ),
            Container(
              // width: size.width * 0.8,
              // height: size.height * 0.4,
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: CustomTheme.transparentColor
              ),
              child: QrImage(
                data: favoriteQR.qrscan,
                foregroundColor: Colors.black,
                version: QrVersions.auto,
                padding: const EdgeInsets.all(0.0),
              ),
            ),
            const SizedBox(
              height: 20.0
            ),
            Text(favoriteQR.qrscan, style: const TextStyle(
              color: CustomTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.0), textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ChooseColor(color: Colors.black,),
                ChooseColor(color: Colors.blueAccent,),
                ChooseColor(color: Colors.redAccent,),
                ChooseColor(color: Colors.green,),
                ChooseColor(color: Colors.yellow,),
                ChooseColor(color: Colors.purple,),
              ],
            )
          ],
        )
      ),
    );
  }
}

class ChooseColor extends StatelessWidget {
  const ChooseColor({
    Key? key,
    required this.color
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: color,
        radius: 16.0,
      ),
      onTap: () {
        
      },
    );
  }
}