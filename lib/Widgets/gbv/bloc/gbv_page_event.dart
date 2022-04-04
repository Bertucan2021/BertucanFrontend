
import 'package:equatable/equatable.dart';

abstract class GBVPageEvent extends Equatable {
  const GBVPageEvent();
}

class InitializeGBVCenters extends GBVPageEvent {
  const InitializeGBVCenters();

  @override
  List<Object> get props => [];
}
class SearchPressed extends GBVPageEvent {
  const SearchPressed({required this.searchGbv});
  final String searchGbv;

  @override
  List<Object> get props => [searchGbv];
}