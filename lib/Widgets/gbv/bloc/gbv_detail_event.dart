import 'package:equatable/equatable.dart';

abstract class GBVDetailEvent extends Equatable {
  const GBVDetailEvent();
}

class InitializeGBVDetailEvent extends GBVDetailEvent {
  final int id;
  const InitializeGBVDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
