import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_api/cubit/cubit.dart';
import 'package:jokes_api/theme/theme_provider.dart';
import '../widjets/answer.dart';
import '../widjets/quetions.dart';
import '../widjets/timerwidjet.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm= context.read<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Шутки от бати'),
        actions: [
          GestureDetector(
            onTap: () {
              vm.changeTheme(dark: vm.themeMode==ThemeMode.dark);
            },
            child: Image.asset(context.watch<ThemeProvider>().iconImage,
              scale: 4,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration:  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(context.watch<ThemeProvider>().bgImage),
          ),
        ),
        child: Center(
          child: BlocBuilder<JokesCubit, JokesStates>(
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(height: 55),
                   Center(
                    child: TimerWidget(isloaded: state is JokesSuccesStates,),
                  ),
                  const SizedBox(height: 55),
                  Quetions(
                    quetiontext: state.joke.Quetions,
                    isloading: state is JokesLoadingStates,
                  ),
                  const SizedBox(height: 55),
                  if (state.joke.Answer.isNotEmpty ||
                      state is JokesLoadingStates)
                    Answer(
                      answer: state.joke.Answer,
                    ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          {
            context.read<JokesCubit>().getQuetions();
          }
        },
        child: const Icon(
          Icons.navigate_next_rounded,
          size: 40,
        ),
      ),
    );
  }
}
