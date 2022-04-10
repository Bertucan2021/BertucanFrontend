
import 'package:equatable/equatable.dart';

abstract class CycleEvent extends Equatable{
  const CycleEvent();

  @override
  List<Object?> get props => [];
}

class GetTodayCyclePhase extends CycleEvent{}

class GetDateBasedPhase extends CycleEvent{
  final DateTime date;

  const GetDateBasedPhase({required this.date});
}