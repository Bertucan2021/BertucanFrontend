
import 'package:equatable/equatable.dart';

abstract class GBVPageEvent extends Equatable {
  const GBVPageEvent();
}

class InitializeGBVCenters extends GBVPageEvent {
  const InitializeGBVCenters();

  @override
  List<Object> get props => [];
}
