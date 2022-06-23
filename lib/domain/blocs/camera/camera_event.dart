part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}

//Create the events

class OnCameraPermissionEvent extends CameraEvent {
  // final bool cameraEnabled;
  final bool cameraPermissionGranted;

  const OnCameraPermissionEvent({
    // required this.cameraEnabled, 
    required this.cameraPermissionGranted
  });

}