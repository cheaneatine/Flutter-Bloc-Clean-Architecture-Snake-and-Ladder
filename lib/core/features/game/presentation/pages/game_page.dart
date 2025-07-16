import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake_ladder_game/core/features/game/presentation/widgets/board_widget.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_event.dart';
import '../bloc/game_state.dart';
import '../widgets/dice_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snake & Ladder')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Expanded(child: BoardWidget()),

            const SizedBox(height: 16),

            BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                final isRolling = state is DiceRollInProgress;
                final value = state is DiceRollResult ? state.value : null;

                return Column(
                  children: [
                    DiceWidget(value: value, isRolling: isRolling),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: isRolling
                          ? null
                          : () {
                              context.read<GameBloc>().add(DiceRolled());
                            },
                      child: const Text('Roll Dice'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
