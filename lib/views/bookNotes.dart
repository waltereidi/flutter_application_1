import 'package:flutter/material.dart';

class BookNotes extends StatelessWidget {
  const BookNotes({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text('Home pages', style: theme.textTheme.titleLarge),
        ),
      ),
    );
  }
}
