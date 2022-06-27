import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

part 'generate_event.dart';
part 'generate_state.dart';

class GenerateBloc extends Bloc<GenerateEvent, GenerateState> {

  final TextEditingController generateController = TextEditingController();

  GenerateBloc() : super(const GenerateState()) {
    on<OnCodeGeneratedEvent>((event, emit) => emit(state.copyWith(dataCode: event.dataCode)));
  }

  Widget getDataCode(String dataCode) {

    add(OnCodeGeneratedEvent(dataCode));
    return Center(
      child: QrImage(
        data: dataCode, 
        version: QrVersions.auto,
        size: 300.0,
      ),
    );
  }

}
