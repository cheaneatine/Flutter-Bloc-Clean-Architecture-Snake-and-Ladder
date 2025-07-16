import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

// Example Event
class RollDiceEvent extends GameEvent {}

class DiceRolled extends GameEvent {}
