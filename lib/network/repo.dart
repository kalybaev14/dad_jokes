import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jokes_api/network/entityes.dart';

abstract class JokesRepo {
  Future<JokeResponse> getanswer();
}

class JokeResponse {
  final String? error;
  final JokesEntity? joke;
  JokeResponse({
    this.error,
    this.joke,
  });
}

class JokesI implements JokesRepo {
  JokesI({required this.dio});
  final Dio dio;
  @override
  Future<JokeResponse> getanswer() async {
    Response response;
    try {
      do {
        response = await dio.get('https://icanhazdadjoke.com/');
      } while (!response.data['joke'].toString().contains('?'));
      final String joke = response.data['joke'];
      final array = joke.split('?');
      final anwser = array.last;
      final quetions = '${array.first}?';
      return JokeResponse(
        joke: JokesEntity(Answer: anwser, Quetions: quetions),
      );
    } catch (e) {
      return JokeResponse(error: 'Error');
    }
  }
}
