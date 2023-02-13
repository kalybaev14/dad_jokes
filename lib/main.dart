import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_api/cubit/cubit.dart';
import 'package:jokes_api/network/dio_settings.dart';
import 'package:jokes_api/network/repo.dart';
import 'package:jokes_api/screens/main_screen.dart';
import 'package:jokes_api/theme/appthemes.dart';
import 'package:jokes_api/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => DioSettings()),
          RepositoryProvider(
              create: (context) => JokesI(dio: context.read<DioSettings>().dio)),
        ],
        child: BlocProvider(
          create: (context) =>
              JokesCubit(repo: context.read<JokesI>())..getQuetions(),
          child: Builder(
            builder: (context) {
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                darkTheme: AppTheme.darkTheme,
                theme: AppTheme.lightTheme,
                themeMode: context.watch<ThemeProvider>().themeMode,
                home: const MyHomePage(),
              );
            }
          ),
        ),
      ),
    );
  }
}
