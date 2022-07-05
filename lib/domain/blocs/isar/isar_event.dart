part of 'isar_bloc.dart';

abstract class IsarEvent extends Equatable {
  const IsarEvent();

  @override
  List<Object> get props => [];
}

class OnIsarInstanceEvent extends IsarEvent {
  final Isar isar;
  const OnIsarInstanceEvent(this.isar);
}