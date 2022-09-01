import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'personalize_event.dart';
part 'personalize_state.dart';

class PersonalizeBloc extends Bloc<PersonalizeEvent, PersonalizeState> {
  PersonalizeBloc() : super(PersonalizeInitial()) {
    on<PersonalizeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
