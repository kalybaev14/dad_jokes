import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_api/cubit/cubit.dart';
import 'package:jokes_api/theme/theme_provider.dart';

import '../core/style/text_styles.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.isloaded});
  final bool isloaded;
  @override
  State<TimerWidget> createState() => _TimerState();
}

class _TimerState extends State<TimerWidget> {
  Timer? timer;
  final int time = 60;
  final showtime = ValueNotifier<int>(60);

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void didUpdateWidget(TimerWidget oldWidget) {
    if (widget.isloaded) {
      timer?.cancel();
      startTimer();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    showtime.dispose();
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (tick) async {
      showtime.value = time - tick.tick;
      if (showtime.value == 0) {
        timer?.cancel();
        await context.read<JokesCubit>().getQuetions();
        startTimer();
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 34),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:context.watch<ThemeProvider>().containerColor,
      ),
      child: ValueListenableBuilder(
          valueListenable: showtime,
          builder: (context, _, __) {
            return Text(
              showtime.value.toString(),
              style: AppTexstyles.oswald700w30.copyWith(color: Colors.white),
            );
          }),
    );
  }
}
