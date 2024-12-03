import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key}) : super(key: key);

  String get resultPhrase {
    if (resultScore <= 8) {
      return 'You did it!';
    } else if (resultScore <= 12) {
      return 'Pretty likeable!';
    } else if (resultScore <= 16) {
      return 'You are strange!';
    } else {
      return 'You are terrible!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          resultPhrase,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          'Score: $resultScore',
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20), // Add some spacing
        TextButton(
          onPressed: resetHandler,
          child: const Text(
            'Restart Quiz!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}