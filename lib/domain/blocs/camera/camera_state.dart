part of 'camera_bloc.dart';

class CameraState extends Equatable {

  // final bool cameraEnabled;
  final bool cameraPermissionGranted;

  const CameraState({
    // required this.cameraEnabled,
    required this.cameraPermissionGranted,
  });

  CameraState copyWith({
    // bool? cameraEnabled,
    bool? cameraPermissionGranted,
  }) => CameraState(
    // cameraEnabled: cameraEnabled ?? this.cameraEnabled, 
    cameraPermissionGranted: cameraPermissionGranted ?? this.cameraPermissionGranted
  );
  
  @override
  List<Object> get props => [ cameraPermissionGranted ];
}
