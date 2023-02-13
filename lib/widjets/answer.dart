import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/style/text_styles.dart';
import '../theme/theme_provider.dart';

class Answer extends StatefulWidget {
  const Answer({
    super.key,
    required this.answer,
  });
  final String answer;

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool isactive = false;
@override
  void didUpdateWidget(covariant Answer oldWidget) {
    if(widget.answer!=oldWidget.answer){
      setState(() {
        isactive=false;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isactive = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: context.watch<ThemeProvider>().containerColor,
        ),
        child: isactive
            ? Text(
                widget.answer,
                style: AppTexstyles.oswald600w16.copyWith(color: Colors.white),
              )
            : Text(
                'Показать ответ',
                style: AppTexstyles.oswald600w16.copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
