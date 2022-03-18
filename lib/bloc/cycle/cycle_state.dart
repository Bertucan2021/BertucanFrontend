
import 'package:equatable/equatable.dart';
abstract class CycleState extends Equatable{
  const CycleState();

  @override
  List<Object?> get props => [];
}

class CycleInitialState extends CycleState{}

class CycleLoadingState extends CycleState{}

class CycleSuccessState extends CycleState{
  final String phase;
  final int day;
  final String chanceOfPregnancy;

  const CycleSuccessState({required this.phase, required this.day, required this.chanceOfPregnancy});
}

class CycleSuccessState2 extends CycleState{
  final String phase;
  final int day;
  final String chanceOfPregnancy;

  const CycleSuccessState2({required this.phase, required this.day, required this.chanceOfPregnancy});
}

class CycleTodayState extends CycleState{
  final DateTime today;

  const CycleTodayState({required this.today});

  @override
  List<Object?> get props => [today];
}

class CycleErrorState extends CycleState{
  final int statusCode;
  final String? errorMessage;

  const CycleErrorState({required this.statusCode, this.errorMessage});
}
