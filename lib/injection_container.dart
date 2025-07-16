import 'package:get_it/get_it.dart';
import 'core/features/game/presentation/bloc/game_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => GameBloc());

  // Later: add use cases, repositories, etc.
}
