part of 'personalize_bloc.dart';

abstract class PersonalizeEvent extends Equatable {
  const PersonalizeEvent();

  @override
  List<Object> get props => [];
}

class OnChangeColorQrPersonalizeEvent extends PersonalizeEvent {
  final Color colorQR;
  const OnChangeColorQrPersonalizeEvent(this.colorQR);
}
