part of 'generate_bloc.dart';

class GenerateState extends Equatable {
  
  final String dataCode;

  const GenerateState({
    this.dataCode = '',
  });

  GenerateState copyWith({
    String? dataCode,
  }) => GenerateState(
    dataCode: dataCode ?? this.dataCode,
  );
  
  @override
  List<Object> get props => [ dataCode ];
}
