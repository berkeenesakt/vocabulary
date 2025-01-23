import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

class WordCard extends StatelessWidget {
  const WordCard({required this.word, super.key});

  final WordModel word;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              word.word,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              word.meaning,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Example: ${word.example}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Pronunciation: ${word.pronunciation}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Chip(
              label: Text(word.level.name),
            ),
          ],
        ),
      ),
    );
  }
}
