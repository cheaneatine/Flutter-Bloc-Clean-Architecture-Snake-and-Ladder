import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/features/game/presentation/bloc/game_bloc.dart';
import 'core/features/game/presentation/pages/game_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const SnakeLadderApp());
}

class SnakeLadderApp extends StatelessWidget {
  const SnakeLadderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<GameBloc>(create: (_) => di.sl<GameBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Snake & Ladder',
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        home: const GamePage(),
      ),
    );
  }
}
