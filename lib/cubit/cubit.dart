import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jokes_api/network/entityes.dart';
import 'package:jokes_api/network/repo.dart';

class JokesCubit extends Cubit<JokesStates> {
  JokesCubit({required this.repo})
      : super(JokesInitialStates(joke: JokesEntity(Quetions: '', Answer: '')));

  final JokesRepo repo;

  Future<void> getQuetions() async {
    emit(JokesLoadingStates(joke: state.joke));
    final result = await repo.getanswer();
    if (result.error == null) {
      emit(JokesSuccesStates(joke: result.joke!));
    } else {
      emit(JokesErrorStates(joke: state.joke));
    }
  }
}

abstract class JokesStates {
  final JokesEntity joke;
  JokesStates({
    required this.joke,
  });
}

class JokesLoadingStates extends JokesStates {
  final JokesEntity joke;
  JokesLoadingStates({
    required this.joke,
  }):super(joke: joke);
}

class JokesSuccesStates extends JokesStates {
  JokesSuccesStates({required this.joke}):super(joke: joke);
  final JokesEntity joke;
}

class JokesInitialStates extends JokesStates {
  final JokesEntity joke;
  JokesInitialStates({
    required this.joke,
  }):super(joke: joke);
}

class JokesErrorStates extends JokesStates {
  final JokesEntity joke;
  JokesErrorStates({
    required this.joke,
  }):super(joke: joke);
}
