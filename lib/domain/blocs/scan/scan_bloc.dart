import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {

  ScanResult? scanResult;
  final cancelController = TextEditingController(text: 'Cancel');


  ScanBloc() : super(const ScanState()) {
    on<OnScanResultTypeEvent>((event, emit) => emit(state.copyWith( resultType: event.resultType )));
    on<OnScanRawContentEvent>((event, emit) => emit(state.copyWith( rawContent: event.rawContent )));
    on<OnScanBarcodeFormatEvent>((event, emit) => emit(state.copyWith( barcodeFormat: event.barcodeFormat )));
  }

  //Functions of the Bloc

  ScanOptions scanOptions = const ScanOptions(
    android: AndroidOptions(
      aspectTolerance: 0.5,
      useAutoFocus: true
    ),
    useCamera: -1,
  );
  
  //Function to scan in the app
  Future<void> getScanResult() async {

    try {
      final result = await BarcodeScanner.scan(
        options: scanOptions
      );
      scanResult = result;
      print('📷 ${scanResult!.rawContent}');
    } on PlatformException catch (e) {
      scanResult = ScanResult(
        type: ResultType.Cancelled,
        format: BarcodeFormat.unknown,
        rawContent: e.code == BarcodeScanner.cameraAccessDenied
            ? 'Debes habilitar el permiso de la camara para escanear'
            : 'Error desconocido: $e',
      );
    }
    add(OnScanResultTypeEvent(scanResult!.type));
    add(OnScanRawContentEvent(scanResult!.rawContent));
    add(OnScanBarcodeFormatEvent(scanResult!.format));
  }

  void launchCode(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
  
}
