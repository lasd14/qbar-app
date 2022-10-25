import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart' as permissionHandler;

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {

  StreamSubscription? cameraServiceStream;
  
  CameraBloc() : super(const CameraState(cameraPermissionGranted: false)) {
    on<OnCameraPermissionEvent>((event, emit) => emit(state.copyWith(cameraPermissionGranted: event.cameraPermissionGranted)));

    initCamera();

  }

  Future<void> initCamera() async {

    final statusPermission = await Future.wait([
      isCameraPermissionGranted()
    ]);

    add(OnCameraPermissionEvent(cameraPermissionGranted: statusPermission[0]));
  }

  Future<void> cameraAccess() async {
    final permission = await permissionHandler.Permission.camera.request();

    switch (permission) {
      case permissionHandler.PermissionStatus.granted:
        add(const OnCameraPermissionEvent(cameraPermissionGranted: true));
        break;
      case permissionHandler.PermissionStatus.denied:
      case permissionHandler.PermissionStatus.limited:
      case permissionHandler.PermissionStatus.restricted:
      case permissionHandler.PermissionStatus.permanentlyDenied:
        add(const OnCameraPermissionEvent(cameraPermissionGranted: false));
        permissionHandler.openAppSettings();
        break;
    }
  }

  Future<bool> isCameraPermissionGranted() async {
    final granted = await permissionHandler.Permission.camera.isGranted;

    return granted;
  } 


  
}
