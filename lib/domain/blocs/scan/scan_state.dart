part of 'scan_bloc.dart';

class ScanState extends Equatable {

  final ResultType resultType;
  final String rawContent;
  final BarcodeFormat barcodeFormat;

  const ScanState({
    this.resultType = ResultType.Barcode,
    this.rawContent = '',
    this.barcodeFormat = BarcodeFormat.unknown
  });

  ScanState copyWith({
    ResultType? resultType,
    String? rawContent,
    BarcodeFormat? barcodeFormat
  }) => ScanState(
    resultType: resultType ?? this.resultType,
    rawContent: rawContent ?? this.rawContent,
    barcodeFormat: barcodeFormat ?? this.barcodeFormat
  );

  @override
  List<Object?> get props => [ resultType, rawContent, barcodeFormat ];
}
