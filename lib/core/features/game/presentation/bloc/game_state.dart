import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

// Initial state
class GameInitial extends GameState {}

class DiceRollInProgress extends GameState {}

class DiceRollResult extends GameState {
  final int value;
  const DiceRollResult(this.value);

  @override
  List<Object> get props => [value];
}
