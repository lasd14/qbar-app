part of 'scan_bloc.dart';

abstract class ScanEvent extends Equatable{
  const ScanEvent();

  @override
  List<Object> get props => [];
}

//Create the events

// OnScanResultTypeEvent throws the type of the response of an Scan
class OnScanResultTypeEvent extends ScanEvent {
  final ResultType resultType;
  const OnScanResultTypeEvent(this.resultType);
}

// OnScanRawContentEvent throws the response of an scan
class OnScanRawContentEvent extends ScanEvent {
  final String rawContent;
  const OnScanRawContentEvent(this.rawContent);
}

// OnScanBarcodeFormatEvent throws the format of the scan response
class OnScanBarcodeFormatEvent extends ScanEvent {
  final BarcodeFormat barcodeFormat;
  const OnScanBarcodeFormatEvent(this.barcodeFormat);
}