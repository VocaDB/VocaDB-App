import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class TabPressed extends MainEvent {
  final int index;

  const TabPressed({@required this.index});

  @override
  List<Object> get props => [index];

  @override
  String toString() => 'TabPressed { index: $index }';
}
