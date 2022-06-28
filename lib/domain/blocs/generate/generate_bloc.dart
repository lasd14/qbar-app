import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
// import 'package:screenshot/screenshot.dart';

part 'generate_event.dart';
part 'generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> {

  final TextEditingController generateController = TextEditingController();
  GlobalKey previewContainer = GlobalKey();
  int originalSize = 800;
  // final ScreenshotController screenshotController = ScreenshotController();
  // Uint8List? imageFile;

  GenerateBloc() : super(const GenerateState()) {
    on<OnCodeGeneratedEvent>((event, emit) => emit(state.copyWith(dataCode: event.dataCode)));
  }

  Widget getDataCode(String dataCode) {

    add(OnCodeGeneratedEvent(dataCode));
    return Center(
      child: QrImage(
        data: dataCode, 
        version: QrVersions.auto,
        size: 250.0,
      ),
    );
  }

  Widget getScreenshotQr(String dataCode) {
    return RepaintBoundary(
      key: previewContainer,
      child: getDataCode(dataCode),
    );
  }
  
  Future<dynamic> shareScreenshotQr() {
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
