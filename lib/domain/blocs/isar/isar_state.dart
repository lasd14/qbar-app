part of 'isar_bloc.dart';

class IsarState extends Equatable {

  final Isar? isar;

  const IsarState({
    this.isar,
  });

  IsarState copyWith({
    Isar? isar,
  }) => IsarState(
    isar: isar ?? this.isar,
  );
  
  @override
  List<Object?> get props => [ isar ];
}
