import 'package:flutter/material.dart';

class TranslationCard extends StatelessWidget {
  final String original;
  final String translated;
  final String languagePair;

  const TranslationCard({
    super.key,
    required this.original,
    required this.translated,
    required this.languagePair,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('English - Spanish'),
                Icon(Icons.star_border_outlined),
              ],
            ),
            Text('Hello'),
            Text('Hello'),
          ],
        ),
      ),
    );
  }
}
