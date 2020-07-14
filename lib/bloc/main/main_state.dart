import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  final int index = 0;
  const MainState();

  @override
  List<Object> get props => [];
}

class DisplayHomeTab extends MainState {
  final index = 0;

  @override
  List<Object> get props => [index];
}

class DisplayRankingTab extends MainState {
  final index = 1;

  @override
  List<Object> get props => [index];
}

class DisplayMenuTab extends MainState {
  final index = 2;

  @override
  List<Object> get props => [index];
}
