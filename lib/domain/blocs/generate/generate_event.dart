part of 'generate_bloc.dart';

abstract class GenerateEvent extends Equatable {
  const GenerateEvent();

  @override
  List<Object> get props => [];
}

class OnCodeGeneratedEvent extends GenerateEvent {
  final String dataCode;
  const OnCodeGeneratedEvent(this.dataCode);
}
