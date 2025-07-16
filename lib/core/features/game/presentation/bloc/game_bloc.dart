import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final _random = Random();

  GameBloc() : super(GameInitial()) {
    on<DiceRolled>(_onDiceRolled); // Placeholder logic for dice roll
  }

  Future<void> _onDiceRolled(DiceRolled event, Emitter<GameState> emit) async {
    emit(DiceRollInProgress());
    await Future.delayed(const Duration(milliseconds: 800));
    final rolledValue = _random.nextInt(6) + 1;
    emit(DiceRollResult(rolledValue));
  }
}
