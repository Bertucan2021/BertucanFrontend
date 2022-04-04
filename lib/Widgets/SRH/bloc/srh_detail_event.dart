import 'package:equatable/equatable.dart';

abstract class SRHDetailEvent extends Equatable {
  const SRHDetailEvent();
}

class InitializeSRHDetailEvent extends SRHDetailEvent {
  final int id;
  const InitializeSRHDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
