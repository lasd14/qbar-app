import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';

class ButtonFav extends StatelessWidget {
  const ButtonFav({
    Key? key,
    required this.scanResult,
    required this.generateBloc
  }) : super(key: key);

  final String scanResult;
  final GenerateBloc generateBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: CustomTheme.rippleColor,
          radius: 35.0,
          child: IconButton(
            onPressed: () {

              final isarBloc = BlocProvider.of<IsarBloc>(context);
              isarBloc.insertFavorite(scanResult);
              saveFavorite(generateBloc, context);
              generateBloc.generateController.clear();              
            },
            icon: const Icon(Icons.bookmark_add_rounded, color: CustomTheme.whiteColor, size: 35.0),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Text('Guardar', style: TextStyle(
          color: CustomTheme.blackColor,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.center,)
      ],
    );
  }

  //TODO: VER SI EXISTE MANERA DE CONTROLAR USANDO EL ISARBLOC O EL SCANRESULT DEL GUARDADO
  void saveFavorite(GenerateBloc generateBloc, BuildContext context) {
    generateBloc.generateController.text.isEmpty
    ? showToast(
      "❌ No puedes guardar un código vacío",
      context: context,
      position: StyledToastPosition.center,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      startOffset: const Offset(0.0, -3.0),
      reverseEndOffset: const Offset(0.0, -3.0),
      duration: const Duration(seconds: 4),
      animDuration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      reverseCurve: Curves.fastOutSlowIn,
      backgroundColor: CustomTheme.blackColor.withOpacity(0.7),
      borderRadius: BorderRadius.circular(12.0),
      textStyle: const TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold, fontSize: 18.0),
      textPadding: const EdgeInsets.all(20.0),
    )
    : generateBloc.generateController.text.isNotEmpty
    ? showToast(
      "✅ ¡Su Código se ha guardado en favoritos!",
      context: context,
      position: StyledToastPosition.center,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      startOffset: const Offset(0.0, -3.0),
      reverseEndOffset: const Offset(0.0, -3.0),
      duration: const Duration(seconds: 5),
      animDuration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      reverseCurve: Curves.fastOutSlowIn,
      backgroundColor: CustomTheme.blackColor.withOpacity(0.7),
      borderRadius: BorderRadius.circular(12.0),
      textStyle: const TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold, fontSize: 18.0),
      textPadding: const EdgeInsets.all(20.0),
    )
    : showToast(
      "❌ ¡Necesitamos esto para generar tu código!", 
      context: context,
      position: StyledToastPosition.center,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      startOffset: const Offset(0.0, -3.0),
      reverseEndOffset: const Offset(0.0, -3.0),
      duration: const Duration(seconds: 4),
      animDuration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      reverseCurve: Curves.fastOutSlowIn,
      backgroundColor: CustomTheme.blackColor.withOpacity(0.7),
      borderRadius: BorderRadius.circular(12.0),
      textStyle: const TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold, fontSize: 18.0),
      textPadding: const EdgeInsets.all(20.0),
    );
  }
}