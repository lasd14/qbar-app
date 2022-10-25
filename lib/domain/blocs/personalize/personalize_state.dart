part of 'personalize_bloc.dart';

class PersonalizeState extends Equatable {

  final Color colorQR;

  const PersonalizeState({
    this.colorQR = Colors.black,
  });

  PersonalizeState copyWith({
    Color? colorQR,
  }) => PersonalizeState(
    colorQR: colorQR ?? this.colorQR,
  );
  
  @override
  List<Object> get props => [ colorQR ];
}