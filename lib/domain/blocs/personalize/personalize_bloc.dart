import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

part 'personalize_event.dart';
part 'personalize_state.dart';

class PersonalizeBloc extends Bloc<PersonalizeEvent, PersonalizeState> {

  GlobalKey previewContainer = GlobalKey();
  int originalSize = 800;

  PersonalizeBloc() : super(const PersonalizeState()) {
    on<OnChangeColorQrPersonalizeEvent>((event, emit) => emit( state.copyWith(colorQR: event.colorQR) ));
  }

  Widget getQrPersonalized(String dataCode, Color color) {
    return QrImage(
      data: dataCode, 
      version: QrVersions.auto,
      size: 80.0,
      foregroundColor: color,
      padding: const EdgeInsets.all(0.0),
    );
  }

  Widget getScreenshotPersonalizedQr(String dataCode) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: RepaintBoundary(
        key: previewContainer,
        child: getQrPersonalized(dataCode, state.colorQR),
      ),
    );
  }

  //TODO: PASAR UN PARAMETRO PARA CAMBIAR EL NOMBRE DE QR.PNG Y EL TEXTO COMPARTIDO
  Future<dynamic> shareScreenshotPersonalizedQr() {
    return ShareFilesAndScreenshotWidgets().shareScreenshot(
      previewContainer, 
      originalSize,
      "QR",
      "qr.png",
      "qr/png",
      text: "QR Compartido desde QBar App ✅",
    );
  }

}