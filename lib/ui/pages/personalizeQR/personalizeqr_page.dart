import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/data/database/tables.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class PersonalizeQrPage extends StatelessWidget {
  const PersonalizeQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final personalizeBloc = BlocProvider.of<PersonalizeBloc>(context);
    final favoriteQR = ModalRoute.of(context)!.settings.arguments as Favorites;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,
              color: CustomTheme.whiteColor, size: 26.00),
        ),
        backgroundColor: CustomTheme.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Personaliza el Código QR',
          style: TextStyle(
              color: CustomTheme.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
        children: [
          const SizedBox(height: 5.0),
          const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text('Personaliza el QR y compártelo con tus amigos', style: TextStyle(color: CustomTheme.primaryColor, fontWeight: FontWeight.bold, fontSize: 18.0), textAlign: TextAlign.center),
          ),
          Container(
            // width: size.width * 0.8,
            // height: size.height * 0.4,
            width: 250,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: CustomTheme.transparentColor),
            child: BlocBuilder<PersonalizeBloc, PersonalizeState>(
              builder: (context, state) {
                return personalizeBloc.getScreenshotPersonalizedQr(favoriteQR.qrscan);
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            favoriteQR.qrscan,
            style: const TextStyle(
                color: CustomTheme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ChooseColorQr(color: Colors.black),
              ChooseColorQr(color: Colors.blueAccent),
              ChooseColorQr(color: Colors.redAccent),
              ChooseColorQr(color: Colors.green),
              ChooseColorQr(color: Colors.yellow),
              ChooseColorQr(color: Colors.purple),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              width: size.width * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  final personalizeBloc = BlocProvider.of<PersonalizeBloc>(context);
                  personalizeBloc.shareScreenshotPersonalizedQr();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: CustomTheme.secondaryColor,
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text('Compartir QR Personalizado', style: TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold, fontSize: 16.0),),
              ),
            ),
        ],
      )),
    );
  }
}

class ChooseColorQr extends StatelessWidget {
  const ChooseColorQr({
    Key? key,
    required this.color,
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
        final personalizeBloc = BlocProvider.of<PersonalizeBloc>(context);
        personalizeBloc.add(OnChangeColorQrPersonalizeEvent(color));
      },
    );
  }
}