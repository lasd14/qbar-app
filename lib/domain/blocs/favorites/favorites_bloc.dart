import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qbar_app/ui/themes/custom_theme.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {

  GlobalKey previewContainer = GlobalKey();
  int originalSize = 100;

  FavoritesBloc() : super(const FavoritesState()) {
    on<OnCodeFavoritesEvent>((event, emit) => emit( state.copyWith( dataCode: event.dataCode )));
    on<OnDataIsLoadedEvent>((event, emit) => emit( state.copyWith( isLoaded: true )));
    on<OnDataIsNotLoadedEvent>((event, emit) => emit( state.copyWith( isLoaded: false )));
  }

  Widget getDataCode(String dataCode) {
    add(OnCodeFavoritesEvent(dataCode));
    return QrImage(
      data: dataCode, 
      version: QrVersions.auto,
      size: 80.0,
      foregroundColor: CustomTheme.whiteColor,
    );
  }

  Widget getScreenshotQr(String dataCode) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0),
      child: Center(
        child: RepaintBoundary(
          key: previewContainer,
          child: getDataCode(dataCode),
        ),
      ),
    );
  }
  
  //TODO: PASAR UN PARAMETRO PARA CAMBIAR EL NOMBRE DE QR.PNG Y EL TEXTO COMPARTIDO
  Future<dynamic> shareScreenshotQr() async {
    return ShareFilesAndScreenshotWidgets().shareScreenshot(
      previewContainer, 
      originalSize,
      "QR",
      "qr.png",
      "qr/png",
      text: "QR Compartido desde QBar App ✅",
    );
  }

  Future<dynamic> shareScreenshotFavoriteQR() {
    return ShareFilesAndScreenshotWidgets().takeScreenshot(
      previewContainer, 
      originalSize,
    );
  }

  void launchCode(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future loadData() async {
    Future.delayed(const Duration(milliseconds: 2000), () {
      add(OnDataIsLoadedEvent());
    });
  }

  Future notLoadData() async {
    Future.delayed(const Duration(milliseconds: 1000), () {
      add(OnDataIsNotLoadedEvent());
    });
  }
}
