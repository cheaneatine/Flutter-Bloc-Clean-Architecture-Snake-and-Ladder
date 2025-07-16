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

class GameInProgress extends GameState {
  final List<int> playerPositions;
  final int currentPlayerIndex;
  final int? lastRolledValue;
  final bool isRolling;

  const GameInProgress({
    required this.playerPositions,
    required this.currentPlayerIndex,
    this.lastRolledValue,
    required this.isRolling,
  });

  @override
  List<Object> get props => [
    playerPositions,
    currentPlayerIndex,
    lastRolledValue ?? 0,
    isRolling,
  ];
}
