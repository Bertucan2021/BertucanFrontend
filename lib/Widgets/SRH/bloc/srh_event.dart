import 'package:equatable/equatable.dart';

abstract class SRHEvent extends Equatable {
  const SRHEvent();
}

class InitializeSRH extends SRHEvent {
  const InitializeSRH();

  @override
  List<Object> get props => [];
}
class SearchIconPressed extends SRHEvent {
  const SearchIconPressed({required this.searchTag});
  final String searchTag;

  @override
  List<Object> get props => [searchTag];
}