import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_api/cubit/cubit.dart';
import 'package:jokes_api/theme/theme_provider.dart';
import '../core/style/text_styles.dart';

class Quetions extends StatelessWidget {
  const Quetions(
      {super.key, required this.quetiontext, required this.isloading});
  final String quetiontext;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 34),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.watch<ThemeProvider>().containerColor,
      ),
      constraints:const BoxConstraints(
        minWidth: double.infinity,
        minHeight: 180,
      ),
      child: Column(
        children: [
          Text(
            'Шутка от бати',
            style: AppTexstyles.oswald600w16.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 28),
          if (!isloading)
            Text(
              quetiontext,
              style: AppTexstyles.oswald600w16.copyWith(color: Colors.white),
            ),
          if (isloading) const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
