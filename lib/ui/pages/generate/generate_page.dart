import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbar_app/domain/blocs/blocs.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class GeneratePage extends StatelessWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final generateBloc = BlocProvider.of<GenerateBloc>(context);

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
        title: const Text('Generar QR', style: TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
              child: Text('Puedes generar un código QR, escribiendo en el campo de texto', style: TextStyle(
                color: CustomTheme.blackColor, 
                fontWeight: FontWeight.bold, 
                fontSize: 18.0), textAlign: TextAlign.center,
              )
            ),
            const SizedBox(
              height: 10.0
            ),
            Container(
              width: size.width * 0.9,
              height: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: CustomTheme.whiteColor,
              ),
              child: generateBloc.getDataCode(generateBloc.generateController.text)
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: size.width * 0.9,
              child: TextField(
                controller: generateBloc.generateController,
                autocorrect: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: CustomTheme.lightColor,
                      width: 2.0
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: CustomTheme.rippleColor,
                      width: 3.0
                    ),
                  ),
                  prefixIcon: const Icon(Icons.qr_code, color: CustomTheme.rippleColor,),
                  suffixIcon: IconButton(
                    onPressed: () {
                      generateBloc.generateController.clear();
                    }, 
                    icon: const Icon(Icons.clear, color: CustomTheme.blackColor,),
                  ),
                  hintText: '¿Qué quieres generar?',
                ),
                enableSuggestions: true,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: size.width * 0.9,
              child: ElevatedButton(
                onPressed: () {

                  generateBloc.generateController.text.isEmpty
                  ? showToast(
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
                  )
                  : generateBloc.generateController.text.isNotEmpty
                  ? showToast(
                    "✅ ¡Su Código se ha generado con éxito!", 
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

                  generateBloc.generateController.clear();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: CustomTheme.secondaryColor,
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text('Generar QR', style: TextStyle(color: CustomTheme.whiteColor, fontWeight: FontWeight.bold, fontSize: 16.0),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}