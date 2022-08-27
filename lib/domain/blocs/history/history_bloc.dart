import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {

  GlobalKey previewContainer = GlobalKey();
  int originalSize = 100;

  HistoryBloc() : super(const HistoryState()) {
    on<OnCodeHistoryEvent>((event, emit) => emit( state.copyWith( dataCodeHistory: event.dataCodeHistory )));
  }

  Widget getDataCodeHistory(String dataCodeHistory) {
    add(OnCodeHistoryEvent(dataCodeHistory));
    return QrImage(
      data: dataCodeHistory,
      version: QrVersions.auto,
      size: 80.0,
      foregroundColor: CustomTheme.whiteColor,
    );
  }

  Widget getScreenshotQr(String dataCodeHistory) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0),
      child: Center(
        child: RepaintBoundary(
          key: previewContainer,
          child: getDataCodeHistory(dataCodeHistory),
        ),
      ),
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

  void launchCode(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }


}
