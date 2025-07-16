import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: Center(
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            final isRolling = state is DiceRollInProgress;
            final value = state is DiceRollResult ? state.value : null;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DiceWidget(value: value, isRolling: isRolling),
                const SizedBox(height: 30),
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
      ),
    );
  }
}
